import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:products_task/core/controllers/text_fileds_controllers.dart';
import 'package:products_task/core/validationHelper/validation_helper.dart';
import 'package:products_task/core/widgets/default_text_filed.dart';

import '../../../../core/constants/params.dart';

final GlobalKey<FormState> updateProductFormKey = GlobalKey<FormState>();

class UpdateProductTextFields extends StatefulWidget {
  const UpdateProductTextFields({super.key, required this.params});
  final UpdateProductTextFieldsParams params;
  @override
  State<UpdateProductTextFields> createState() =>
      _UpdateProductTextFieldsState();
}

class _UpdateProductTextFieldsState extends State<UpdateProductTextFields> {
  @override
  void initState() {
    super.initState();
    initTextEditingControllers();
  }

  @override
  void dispose() {
    disposeTextEditingControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: updateProductFormKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          DefaultTextFormField(
            controller: MainTextFieldsControllers.updateProductNameController,
            labelText: 'Product Name',
            validator: (value) => ValidationHelper.validateProductName(value),
            prefixIcon: const Icon(Icons.text_fields),
          ),
          SizedBox(height: 10.h),
          DefaultTextFormField(
            controller: MainTextFieldsControllers.updateProductPriceController,
            labelText: 'Product Price',
            validator: (value) => ValidationHelper.validateProductPrice(value),
            prefixIcon: const Icon(Icons.money),
            keyboardType: TextInputType.number,
          ),
        ],
      ),
    );
  }

  void initTextEditingControllers() {
    MainTextFieldsControllers.updateProductNameController =
        TextEditingController(text: widget.params.productName);
    MainTextFieldsControllers.updateProductPriceController =
        TextEditingController(text: widget.params.productPrice.toString());
  }

  void disposeTextEditingControllers() {
    MainTextFieldsControllers.updateProductNameController.dispose();
    MainTextFieldsControllers.updateProductPriceController.dispose();
  }
}
