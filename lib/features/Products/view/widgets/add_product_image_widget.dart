import 'package:flutter/material.dart';
import 'package:products_task/core/constants/app_radius.dart';
import 'package:products_task/core/utls/utls.dart';
import 'package:products_task/features/Products/view_model/add_product_view_model.dart';
import 'package:provider/provider.dart';

class AddProductImageWidget extends StatelessWidget {
  const AddProductImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AddProductProvider>(
      builder: (context, value, child) {
        switch (value.pickImageRequestStatus) {
          case RequestStatusWithIdle.idle:
            return GestureDetector(
              onTap: () {
                value.pickImage();
              },
              child: const CircleAvatar(
                radius: AppRadius.r70,
                child: Center(
                  child: Icon(Icons.add),
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
                backgroundImage: FileImage(value.pickedImage!),
              ),
            );
          case RequestStatusWithIdle.error:
            return GestureDetector(
              onTap: () {
                value.pickImage();
              },
              child: const CircleAvatar(
                radius: AppRadius.r70,
                child: Center(
                  child: Icon(Icons.add),
                ),
              ),
            );
        }
      },
    );
  }
}
