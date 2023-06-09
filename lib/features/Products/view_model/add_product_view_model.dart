import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:products_task/core/constants/app_colors.dart';
import 'package:products_task/core/constants/constant.dart';
import 'package:products_task/core/constants/extensions.dart';
import 'package:products_task/core/utls/utls.dart';
import 'package:products_task/features/Products/model/products_model.dart';

import '../../../core/constants/app_strings.dart';
import '../../../core/constants/params.dart';
import '../repository/base/base_products_repository.dart';
import '../view/screens/add_product_screen.dart';
import 'get_products_view_model.dart';

class AddProductProvider extends ChangeNotifier {
  final BaseProductsRepository _baseProductsRepository;
  final GetProductsProvider _getProductsProvider;
  AddProductProvider(this._baseProductsRepository, this._getProductsProvider);
  //variables
  RequestStatusWithIdle _addProductRequestStatus = RequestStatusWithIdle.idle;
  RequestStatusWithIdle _pickImageRequestStatus = RequestStatusWithIdle.idle;
  File? _pickedImage;
  //getters
  RequestStatusWithIdle get addProductRequestStatus => _addProductRequestStatus;
  RequestStatusWithIdle get pickImageRequestStatus => _pickImageRequestStatus;
  File? get pickedImage => _pickedImage;
  //functions
  void addProduct(
      {required String tableName, required ProductsModel data}) async {
    _addProductRequestStatus = RequestStatusWithIdle.loading;
    notifyListeners();
    final InsertProductParams params = InsertProductParams(
      tableName: tableName,
      data: data.toMap(),
    );
    final result = await _baseProductsRepository.insertProduct(params);

    result.fold((l) {
      _addProductRequestStatus = RequestStatusWithIdle.error;
      notifyListeners();
    }, (r) {
      _addProductRequestStatus = RequestStatusWithIdle.success;

      notifyListeners();
      Constants.showToast(
          message: 'product added successfully',
          backgroundColor: AppColors.toastSuccessColor,
          textColor: Colors.white);
      getAllProducts();
      addProductKey.currentState?.context.naviagtorPop();
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
            backgroundColor: AppColors.toastSuccessColor,
            textColor: Colors.white);
      }
      _pickImageRequestStatus = RequestStatusWithIdle.error;
      notifyListeners();
    }
  }
}
