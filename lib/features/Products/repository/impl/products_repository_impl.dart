import 'package:dartz/dartz.dart';
import 'package:products_task/core/constants/params.dart';
import 'package:products_task/core/error/failure.dart';
import 'package:products_task/features/Products/data/base/base_local_products_data_source.dart';
import 'package:products_task/features/Products/model/products_model.dart';
import 'package:products_task/features/Products/repository/base/base_products_repository.dart';

import '../../../../core/error/exception.dart';

class ProductsRepositoryImpl implements BaseProductsRepository {
  final BaseLocalProductsDataSource _localProductsDataSource;

  const ProductsRepositoryImpl(this._localProductsDataSource);

  @override
  Future<Either<Failure, void>> initDataBase(InitDatabaseParams params) async {
    try {
      final result = await _localProductsDataSource.initDataBase(params);
      return Right(result);
    } on AppDatabaseException catch (exception) {
      return Left(DatabaseFailure(
          message: exception.dataBaseErrorMessageModel.errorMessage));
    }
  }

  @override
  Future<Either<Failure, int>> insertProduct(InsertProductParams params) async {
    try {
      final result = await _localProductsDataSource.insertProduct(params);
      return Right(result);
    } on AppDatabaseException catch (exception) {
      return Left(DatabaseFailure(
          message: exception.dataBaseErrorMessageModel.errorMessage));
    }
  }

  @override
  Future<Either<Failure, List<ProductsModel>>> getAllProducts(
      GetAllProductsParams params) async {
    try {
      final result = await _localProductsDataSource.getAllProducts(params);
      return Right(result);
    } on AppDatabaseException catch (exception) {
      return Left(DatabaseFailure(
          message: exception.dataBaseErrorMessageModel.errorMessage));
    }
  }

  @override
  Future<Either<Failure, int>> updateProduct(UpdateProductParams params) async {
    try {
      final result = await _localProductsDataSource.updateProduct(params);
      return Right(result);
    } on AppDatabaseException catch (exception) {
      return Left(DatabaseFailure(
          message: exception.dataBaseErrorMessageModel.errorMessage));
    }
  }
}
