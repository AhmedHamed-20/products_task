import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:products_task/core/constants/app_strings.dart';
import 'package:products_task/core/constants/extensions.dart';
import 'package:products_task/core/routes/app_routes_names.dart';
import 'package:products_task/features/Products/view_model/get_products_view_model.dart';
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
    return Consumer<GetProductsProvider>(
      builder: (context, value, child) {
        switch (value.getAllDataFromDatabaseRequestStatus) {
          case RequestStatusWithoutIdle.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case RequestStatusWithoutIdle.success:
            return value.productsList.isEmpty
                ? const Center(
                    child: Text('No Data to show add some products'),
                  )
                : ListView.builder(
                    itemCount: value.productsList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          context.navigateToNamed(
                            AppRoutesNames.updateDeleteProduct,
                            arguments: value.productsList[index],
                          );
                        },
                        child: ListTile(
                          leading: Image.memory(
                            value.productsList[index].productImage
                                .readAsBytesSync(),
                            key: ValueKey(value.productsList[index].id),
                            width: 80.w,
                            height: 80.h,
                          ),
                          title: Text(
                            value.productsList[index].productName,
                            style: context.theme.textTheme.titleLarge,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          subtitle: Text(
                            '${value.productsList[index].productPrice} ${AppStrings.egp}',
                            style: context.theme.textTheme.titleSmall,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      );
                    },
                  );

          case RequestStatusWithoutIdle.error:
            return ErrorScreen(
              message: value.errorMessage,
              isHoleScreen: false,
              onRetryPressed: () {},
            );
        }
      },
    );
  }

  void getAllProducts() {
    Provider.of<GetProductsProvider>(context, listen: false).getAllProducts(
        const GetAllProductsParams(tableName: AppStrings.products));
  }
}
