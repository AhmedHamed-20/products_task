import 'package:flutter/material.dart';
import 'package:products_task/core/constants/app_colors.dart';
import 'package:products_task/core/constants/app_strings.dart';
import 'package:products_task/core/constants/constant.dart';
import 'package:products_task/core/controllers/text_fileds_controllers.dart';
import 'package:products_task/core/widgets/default_button.dart';
import 'package:products_task/features/Products/model/products_model.dart';
import 'package:products_task/features/Products/view/widgets/add_products_text_fields.dart';
import 'package:products_task/features/Products/view_model/add_product_view_model.dart';
import 'package:provider/provider.dart';

import '../../../../core/utls/utls.dart';

class AddProductButtonWidget extends StatelessWidget {
  const AddProductButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AddProductProvider>(
      builder: (context, value, child) {
        switch (value.addProductRequestStatus) {
          case RequestStatusWithIdle.idle:
            return const AddProductButtonDesign();
          case RequestStatusWithIdle.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case RequestStatusWithIdle.success:
            return const AddProductButtonDesign();
          case RequestStatusWithIdle.error:
            return const AddProductButtonDesign();
        }
      },
    );
  }
}

class AddProductButtonDesign extends StatelessWidget {
  const AddProductButtonDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AddProductProvider>(
      builder: (context, value, child) => DefaultButtonWithTextWidget(
          onPressed: () {
            onPressedOnAddProductButton(value);
          },
          text: AppStrings.addProduct),
    );
  }

  void onPressedOnAddProductButton(AddProductProvider value) {
    if (value.pickedImage != null &&
        addProductsFormKey.currentState!.validate()) {
      final ProductsModel productsModel = ProductsModel(
        productImage: value.pickedImage!,
        productName: MainTextFieldsControllers.productNameController.text,
        productPrice:
            int.parse(MainTextFieldsControllers.productPriceController.text),
      );
      value.addProduct(data: productsModel, tableName: AppStrings.products);
    } else {
      if (value.pickedImage == null) {
        Constants.showToast(
          message: 'please pick image',
          backgroundColor: AppColors.toastErrorColor,
          textColor: Colors.white,
        );
      }
    }
  }
}
