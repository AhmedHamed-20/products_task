import 'package:dartz/dartz.dart';
import 'package:products_task/core/constants/params.dart';
import 'package:products_task/core/error/failure.dart';
import 'package:products_task/features/Products/model/products_model.dart';

abstract class BaseProductsRepository {
  Future<Either<Failure, void>> initDataBase(InitDatabaseParams params);
  Future<Either<Failure, int>> insertProduct(InsertProductParams params);
  Future<Either<Failure, List<ProductsModel>>> getAllProducts(
      GetAllProductsParams params);

  Future<Either<Failure, int>> updateProduct(UpdateProductParams params);
  Future<Either<Failure, int>> deleteProduct(DeleteProductParams params);
}
