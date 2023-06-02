import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:products_task/core/constants/app_padding.dart';
import 'package:products_task/core/constants/app_strings.dart';
import 'package:products_task/core/constants/extensions.dart';
import 'package:products_task/features/Products/model/products_model.dart';

import '../../../../core/constants/params.dart';
import '../widgets/update_product_button_widget.dart';
import '../widgets/update_product_image_widget.dart';
import '../widgets/update_product_screen_text_fields.dart';

final GlobalKey updateProductScreenKey = GlobalKey();

class UpdateDeleteProductScreen extends StatelessWidget {
  const UpdateDeleteProductScreen({super.key, required this.product});
  final ProductsModel product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: updateProductScreenKey,
      appBar: AppBar(
        title: Text(
          AppStrings.updateProduct,
          style: context.theme.textTheme.titleLarge,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p10),
          child: Column(
            children: [
              UpdateProductImageWidget(productImage: product.productImage),
              SizedBox(
                height: 10.h,
              ),
              UpdateProductTextFields(
                params: UpdateProductTextFieldsParams(
                  productName: product.productName,
                  productPrice: product.productPrice,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              UpdateProductButtonWidget(
                productsModel: product,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
