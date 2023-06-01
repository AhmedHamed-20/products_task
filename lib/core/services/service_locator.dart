import 'package:get_it/get_it.dart';
import 'package:products_task/features/Products/repository/base/base_products_repository.dart';
import 'package:products_task/features/Products/repository/impl/products_repository_impl.dart';

import '../../features/Products/data/base/base_local_products_data_source.dart';
import '../../features/Products/data/impl/local_products_data_source_impl.dart';

GetIt serviceLocator = GetIt.instance;

class ServiceLocator {
  static void setup() {
    //repository
    serviceLocator.registerLazySingleton<BaseProductsRepository>(
        () => ProductsRepositoryImpl(serviceLocator()));

    //data source
    serviceLocator.registerLazySingleton<BaseLocalProductsDataSource>(
        () => LocalProductsDataSourceImpl());
  }
}
