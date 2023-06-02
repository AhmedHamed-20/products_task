import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:products_task/core/constants/app_padding.dart';
import 'package:products_task/core/constants/app_strings.dart';
import 'package:products_task/core/constants/extensions.dart';

import '../widgets/add_product_button_widget.dart';
import '../widgets/add_products_text_fields.dart';
import '../widgets/add_product_image_widget.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.addProduct,
          style: context.theme.textTheme.titleLarge,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p10),
          child: Column(
            children: [
              const AddProductImageWidget(),
              SizedBox(
                height: 10.h,
              ),
              const AddProductsTextFields(),
              SizedBox(
                height: 10.h,
              ),
              const AddProductButtonWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
