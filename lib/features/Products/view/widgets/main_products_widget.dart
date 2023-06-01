import 'package:flutter/material.dart';
import 'package:products_task/core/constants/app_strings.dart';
import 'package:products_task/features/Products/view_model/products_view_model.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/params.dart';
import '../../../../core/utls/utls.dart';
import '../../../../core/widgets/error_screen.dart';

class ProductsWidget extends StatefulWidget {
  const ProductsWidget({super.key});

  @override
  State<ProductsWidget> createState() => _ProductsWidgetState();
}

class _ProductsWidgetState extends State<ProductsWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        getAllProducts();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductsProvider>(
      builder: (context, value, child) {
        switch (value.getAllDataFromDatabaseRequestStatus) {
          case RequestStatusWithoutIdle.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case RequestStatusWithoutIdle.success:
            return value.productsList.isEmpty
                ? const Center(
                    child: Text('No Data'),
                  )
                : ListView.builder(
                    itemCount: value.productsList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(value.productsList[index].productName),
                      );
                    },
                  );

          case RequestStatusWithoutIdle.error:
            return ErrorScreen(
              message: value.errorMessage,
              isHoleScreen: false,
              onRetryPressed: () {},
            );
          default:
            return const SizedBox();
        }
      },
    );
  }

  void getAllProducts() {
    Provider.of<ProductsProvider>(context, listen: false).getAllProducts(
        const GetAllProductsParams(tableName: AppStrings.products));
  }
}
