import 'package:products_task/features/Products/data/base/base_local_products_data_source.dart';
import 'package:products_task/features/Products/repository/base/base_products_repository.dart';

class ProductsRepositoryImpl implements BaseProductsRepository {
  final BaseLocalProductsDataSource localProductsDataSource;

  const ProductsRepositoryImpl(this.localProductsDataSource);
}
