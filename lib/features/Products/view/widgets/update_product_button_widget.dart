import 'dart:io';

import 'package:flutter/material.dart';
import 'package:products_task/core/constants/app_strings.dart';
import 'package:products_task/core/controllers/text_fileds_controllers.dart';
import 'package:products_task/core/widgets/default_button.dart';
import 'package:products_task/features/Products/model/products_model.dart';
import 'package:products_task/features/Products/view_model/update_delete_product_view_model.dart';
import 'package:provider/provider.dart';

import '../../../../core/utls/utls.dart';

class UpdateProductButtonWidget extends StatelessWidget {
  const UpdateProductButtonWidget({super.key, required this.productsModel});
  final ProductsModel productsModel;
  @override
  Widget build(BuildContext context) {
    return Consumer<UpdateDeleteProductProvider>(
      builder: (context, value, child) {
        switch (value.updateProductStatus) {
          case RequestStatusWithIdle.idle:
            return UpdateProductButtonDesign(
              imageFile: value.pickedImage ?? productsModel.productImage,
              productId: productsModel.id!,
            );
          case RequestStatusWithIdle.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case RequestStatusWithIdle.success:
            return UpdateProductButtonDesign(
              imageFile: value.pickedImage ?? productsModel.productImage,
              productId: productsModel.id!,
            );
          case RequestStatusWithIdle.error:
            return UpdateProductButtonDesign(
              imageFile: value.pickedImage ?? productsModel.productImage,
              productId: productsModel.id!,
            );
        }
      },
    );
  }
}

class UpdateProductButtonDesign extends StatelessWidget {
  const UpdateProductButtonDesign(
      {super.key, required this.imageFile, required this.productId});
  final File imageFile;
  final int productId;
  @override
  Widget build(BuildContext context) {
    return DefaultButtonWithTextWidget(
      onPressed: () {
        onPressedOnUpdateButton(context, productId);
      },
      text: AppStrings.updateProduct,
    );
  }

  void onPressedOnUpdateButton(BuildContext context, int productId) {
    final provider =
        Provider.of<UpdateDeleteProductProvider>(context, listen: false);

    final ProductsModel updatedProductsModel = ProductsModel(
      productName: MainTextFieldsControllers.updateProductNameController.text,
      productPrice: int.parse(
          MainTextFieldsControllers.updateProductPriceController.text),
      productImage: imageFile,
      id: productId,
    );

    provider.updateProduct(
      productsModel: updatedProductsModel,
      tableName: AppStrings.products,
    );
  }
}
