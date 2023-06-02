import 'package:products_task/core/constants/params.dart';
import 'package:products_task/core/database/base_database_service.dart';
import 'package:products_task/core/error/error_message_model.dart';
import 'package:products_task/features/Products/data/base/base_local_products_data_source.dart';
import 'package:products_task/features/Products/model/products_model.dart';

import '../../../../core/error/exception.dart';

class LocalProductsDataSourceImpl implements BaseLocalProductsDataSource {
  final BaseDataBaseService _baseDataBaseService;

  LocalProductsDataSourceImpl(this._baseDataBaseService);

  @override
  Future<void> initDataBase(InitDatabaseParams params) async {
    try {
      await _baseDataBaseService.init(
          databasesName: params.databasesName,
          version: params.version,
          query: params.query);
    } on Exception catch (e) {
      throw AppDatabaseException(LocalErrorsMessageModel.fromException(e));
    }
  }

  @override
  Future<int> insertProduct(InsertProductParams params) async {
    try {
      final result = await _baseDataBaseService.insertIntoDataBase(
          tableName: params.tableName, data: params.data);
      return result;
    } on Exception catch (e) {
      throw AppDatabaseException(LocalErrorsMessageModel.fromException(e));
    }
  }

  @override
  Future<List<ProductsModel>> getAllProducts(
      GetAllProductsParams params) async {
    try {
      final result =
          await _baseDataBaseService.getAllDataFromDatabase(params.tableName);
      return (result).map((e) => ProductsModel.fromMap(e)).toList();
    } on Exception catch (e) {
      throw AppDatabaseException(LocalErrorsMessageModel.fromException(e));
    }
  }

  @override
  Future<int> updateProduct(UpdateProductParams params) async {
    try {
      final result =
          await _baseDataBaseService.updateDataBase(params.query, params.args);
      return result;
    } on Exception catch (e) {
      throw AppDatabaseException(LocalErrorsMessageModel.fromException(e));
    }
  }
}
