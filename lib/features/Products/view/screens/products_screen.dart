import 'package:flutter/material.dart';
import 'package:products_task/core/constants/app_padding.dart';
import 'package:products_task/core/constants/app_strings.dart';
import 'package:products_task/core/constants/extensions.dart';
import 'package:products_task/core/routes/app_routes_names.dart';
import 'package:products_task/core/widgets/error_screen.dart';
import 'package:products_task/features/Products/view_model/get_products_view_model.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/params.dart';
import '../../../../core/database/datebase_queries.dart';
import '../../../../core/utls/utls.dart';
import '../widgets/main_products_widget.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Products',
          style: context.theme.textTheme.titleLarge,
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.navigateToNamed(AppRoutesNames.addProduct);
            },
            icon: Icon(
              Icons.add,
              color: context.theme.primaryColor,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p10),
        child: Consumer<GetProductsProvider>(
          builder: (context, productsProvider, child) {
            switch (productsProvider.initDatabaseRequestStatus) {
              case RequestStatusWithoutIdle.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case RequestStatusWithoutIdle.success:
                return const ProductsWidget();
              case RequestStatusWithoutIdle.error:
                return ErrorScreen(
                  message: productsProvider.errorMessage,
                  isHoleScreen: false,
                  onRetryPressed: () {
                    productsProvider.initDataBase(
                      const InitDatabaseParams(
                        databasesName: AppStrings.products,
                        query: DatebaseQueries.createTableQuery,
                        version: 1,
                      ),
                    );
                  },
                );
            }
          },
        ),
      ),
    );
  }
}
