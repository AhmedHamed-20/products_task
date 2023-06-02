import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:products_task/core/constants/extensions.dart';
import 'package:products_task/core/constants/params.dart';
import 'package:products_task/core/utls/utls.dart';
import 'package:products_task/features/Products/model/products_model.dart';
import 'package:products_task/features/Products/repository/base/base_products_repository.dart';
import 'package:products_task/features/Products/view_model/get_products_view_model.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/constants/constant.dart';
import '../../../core/database/datebase_queries.dart';
import '../view/screens/update_delete_product_screen.dart';

class UpdateDeleteProductProvider extends ChangeNotifier {
  final BaseProductsRepository _baseProductsRepository;
  final GetProductsProvider _getProductsProvider;
  UpdateDeleteProductProvider(
      this._baseProductsRepository, this._getProductsProvider);
  //variables
  RequestStatusWithIdle _updateProductStatus = RequestStatusWithIdle.idle;
  RequestStatusWithIdle _deleteProductStatus = RequestStatusWithIdle.idle;

  File? _pickedImage;
  RequestStatusWithIdle _pickImageRequestStatus = RequestStatusWithIdle.idle;
  //getters
  RequestStatusWithIdle get updateProductStatus => _updateProductStatus;
  File? get pickedImage => _pickedImage;
  RequestStatusWithIdle get pickImageRequestStatus => _pickImageRequestStatus;
  RequestStatusWithIdle get deleteProductStatus => _deleteProductStatus;
  //functions

  Future<void> updateProduct({
    required ProductsModel productsModel,
    required String tableName,
  }) async {
    _updateProductStatus = RequestStatusWithIdle.loading;
    notifyListeners();
    //to get image as bytes
    final productImage = productsModel.toMap()[AppStrings.productImage];
    final listArgs = [
      productsModel.productName,
      productsModel.productPrice,
      productImage,
      productsModel.id
    ];
    final params =
        UpdateProductParams(DatebaseQueries.updateTable(tableName), listArgs);
    final result = await _baseProductsRepository.updateProduct(params);
    result.fold((l) {
      _updateProductStatus = RequestStatusWithIdle.error;
      notifyListeners();
    }, (r) {
      _updateProductStatus = RequestStatusWithIdle.success;
      notifyListeners();
      Constants.showToast(
          message: 'product updated successfully',
          backgroundColor: AppColors.toastSuccessColor,
          textColor: Colors.white);
      getAllProducts();
      updateProductScreenKey.currentState?.context.naviagtorPop();
    });
  }

  Future<void> getAllProducts() {
    return _getProductsProvider.getAllProducts(
        const GetAllProductsParams(tableName: AppStrings.products));
  }

  Future<void> pickImage() async {
    _pickImageRequestStatus = RequestStatusWithIdle.loading;
    final result = await FilePicker.platform.pickFiles(type: FileType.image);
    //pick image and size less than 5 mb
    if (result != null && result.files.single.size < 5000000) {
      _pickedImage = File(result.files.single.path!);
      _pickImageRequestStatus = RequestStatusWithIdle.success;
      notifyListeners();
    } else {
      if (result != null && result.files.single.size > 5000000) {
        Constants.showToast(
            message: 'image size must be less than 5 mb',
            backgroundColor: AppColors.toastWarningColor,
            textColor: Colors.black);
      } else if (result == null) {
        Constants.showToast(
            message: 'error in picking image',
            backgroundColor: AppColors.toastErrorColor,
            textColor: Colors.white);
      }
      _pickImageRequestStatus = RequestStatusWithIdle.error;
      notifyListeners();
    }
  }

  Future<void> deleteProduct(DeleteProductParams params) async {
    _deleteProductStatus = RequestStatusWithIdle.loading;
    notifyListeners();
    final result = await _baseProductsRepository.deleteProduct(params);
    result.fold((l) {
      _deleteProductStatus = RequestStatusWithIdle.error;
      notifyListeners();
    }, (r) {
      _deleteProductStatus = RequestStatusWithIdle.success;
      notifyListeners();
      Constants.showToast(
          message: 'product deleted successfully',
          backgroundColor: AppColors.toastSuccessColor,
          textColor: Colors.white);
      getAllProducts();
      updateProductScreenKey.currentState?.context.naviagtorPop();
    });
  }
}
