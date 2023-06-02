import 'package:flutter/material.dart';
import 'package:products_task/core/constants/app_strings.dart';
import 'package:products_task/core/constants/extensions.dart';
import 'package:products_task/core/constants/params.dart';
import 'package:provider/provider.dart';

import '../../view_model/update_delete_product_view_model.dart';

class DeleteProductAlertDialog extends StatelessWidget {
  const DeleteProductAlertDialog(
      {super.key, required this.deleteProductParams});
  final DeleteProductParams deleteProductParams;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        AppStrings.deleteProduct,
        style: context.theme.textTheme.titleMedium,
      ),
      content: Text(
        AppStrings.areYouSureYouWantToDeleteThisProduct,
        style: context.theme.textTheme.titleSmall,
      ),
      actions: [
        TextButton(
          onPressed: () {
            context.naviagtorPop();
          },
          child: Text(AppStrings.no, style: context.theme.textTheme.titleSmall),
        ),
        TextButton(
          onPressed: () {
            onPressedOnDelete(context);
            context.naviagtorPop();
          },
          child: Text(
            AppStrings.yes,
            style: context.theme.textTheme.titleSmall,
          ),
        ),
      ],
    );
  }

  void onPressedOnDelete(BuildContext context) {
    final provider =
        Provider.of<UpdateDeleteProductProvider>(context, listen: false);
    provider.deleteProduct(deleteProductParams);
  }
}
