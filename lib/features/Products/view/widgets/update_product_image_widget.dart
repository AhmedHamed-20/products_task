import 'dart:io';

import 'package:flutter/material.dart';
import 'package:products_task/core/utls/utls.dart';
import 'package:products_task/features/Products/view_model/update_delete_product_view_model.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/app_radius.dart';

class UpdateProductImageWidget extends StatelessWidget {
  const UpdateProductImageWidget({super.key, required this.productImage});
  final File productImage;
  @override
  Widget build(BuildContext context) {
    return Consumer<UpdateDeleteProductProvider>(
      builder: (context, value, child) {
        switch (value.pickImageRequestStatus) {
          case RequestStatusWithIdle.idle:
            return GestureDetector(
              onTap: () {
                value.pickImage();
              },
              child: CircleAvatar(
                radius: AppRadius.r70,
                backgroundImage: MemoryImage(
                  productImage.readAsBytesSync(),
                ),
              ),
            );
          case RequestStatusWithIdle.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case RequestStatusWithIdle.success:
            return GestureDetector(
              onTap: () {
                value.pickImage();
              },
              child: CircleAvatar(
                radius: AppRadius.r70,
                backgroundImage: FileImage(
                  value.pickedImage!,
                ),
              ),
            );
          case RequestStatusWithIdle.error:
            return GestureDetector(
              onTap: () {
                value.pickImage();
              },
              child: CircleAvatar(
                radius: AppRadius.r70,
                backgroundImage: FileImage(
                  productImage,
                ),
              ),
            );
        }
      },
    );
  }
}
