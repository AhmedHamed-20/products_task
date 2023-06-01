import 'package:products_task/core/constants/params.dart';

abstract class BaseLocalProductsDataSource {
  Future<void> initDataBase(InitDatabaseParams params);
}
