import 'package:products_task/core/constants/params.dart';
import 'package:products_task/core/database/base_database_service.dart';
import 'package:products_task/core/error/error_message_model.dart';
import 'package:products_task/features/Products/data/base/base_local_products_data_source.dart';

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
}
