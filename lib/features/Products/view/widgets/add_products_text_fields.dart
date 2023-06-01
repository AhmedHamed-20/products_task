import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:products_task/core/validationHelper/validation_helper.dart';

import '../../../../core/controllers/text_fileds_controllers.dart';
import '../../../../core/widgets/default_text_filed.dart';

final GlobalKey<FormState> addProductsFormKey = GlobalKey<FormState>();

class AddProductsTextFields extends StatefulWidget {
  const AddProductsTextFields({super.key});

  @override
  State<AddProductsTextFields> createState() => _AddProductsTextFieldsState();
}

class _AddProductsTextFieldsState extends State<AddProductsTextFields> {
  @override
  void initState() {
    super.initState();
    initTextEdidtingControllers();
  }

  @override
  void dispose() {
    disposeTextEdidtingControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: addProductsFormKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          DefaultTextFormField(
            validator: (value) => ValidationHelper.validateProductName(value),
            controller: MainTextFieldsControllers.productNameController,
            prefixIcon: const Icon(Icons.text_fields),
            keyboardType: TextInputType.text,
            labelText: 'Product Name',
          ),
          SizedBox(
            height: 10.h,
          ),
          DefaultTextFormField(
            validator: (value) => ValidationHelper.validateProductPrice(value),
            controller: MainTextFieldsControllers.productPriceController,
            prefixIcon: const Icon(Icons.money),
            labelText: 'Product Price',
            keyboardType: TextInputType.number,
          ),
        ],
      ),
    );
  }

  void initTextEdidtingControllers() {
    MainTextFieldsControllers.productNameController = TextEditingController();
    MainTextFieldsControllers.productPriceController = TextEditingController();
  }

  void disposeTextEdidtingControllers() {
    MainTextFieldsControllers.productNameController.dispose();
    MainTextFieldsControllers.productPriceController.dispose();
  }
}
