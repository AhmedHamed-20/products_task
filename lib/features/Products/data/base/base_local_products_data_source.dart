import 'package:products_task/core/constants/params.dart';
import 'package:products_task/features/Products/model/products_model.dart';

abstract class BaseLocalProductsDataSource {
  Future<void> initDataBase(InitDatabaseParams params);
  Future<int> insertProduct(InsertProductParams params);
  Future<List<ProductsModel>> getAllProducts(GetAllProductsParams params);
  Future<int> updateProduct(UpdateProductParams params);
  Future<int> deleteProduct(DeleteProductParams params);
}
