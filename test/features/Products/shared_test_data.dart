import 'dart:io';

import 'package:products_task/core/constants/app_strings.dart';
import 'package:products_task/core/constants/params.dart';
import 'package:products_task/core/database/datebase_queries.dart';
import 'package:products_task/core/error/error_message_model.dart';
import 'package:products_task/core/error/exception.dart';
import 'package:products_task/features/Products/model/products_model.dart';

const InsertProductParams tInsertProductParams = InsertProductParams(
  tableName: AppStrings.products,
  data: {
    AppStrings.productName: 'test',
    AppStrings.productPrice: 1,
    AppStrings.productImage: 'test',
  },
);

const InitDatabaseParams tInitDatabaseParams = InitDatabaseParams(
  databasesName: AppStrings.products,
  version: 1,
  query: DatebaseQueries.createTableQuery,
);

ProductsModel tProductsModel = ProductsModel(
  productImage: File('path'),
  productName: 'test',
  productPrice: 1,
  id: 1,
);

List<ProductsModel> tProductsList = [tProductsModel];

List<Map<String, dynamic>> tProductsMapList = [
  {
    AppStrings.productName: 'test',
    AppStrings.productPrice: 1,
    AppStrings.productImage: File('path'),
    AppStrings.id: 1,
  }
];

const GetAllProductsParams tGetAllProductsParams = GetAllProductsParams(
  tableName: AppStrings.products,
);

const UpdateProductParams tUpdateProductParams = UpdateProductParams(
  'query',
  [
    'test',
    1,
    'test',
    1,
  ],
);

const DeleteProductParams tDeleteProductParams = DeleteProductParams(
  id: 1,
  tableName: AppStrings.products,
);

const AppDatabaseException tAppDatabaseException = AppDatabaseException(
    LocalErrorsMessageModel(errorMessage: 'error message'));
