import 'package:dartz/dartz.dart';
import 'package:products_task/core/constants/params.dart';
import 'package:products_task/core/error/failure.dart';
import 'package:products_task/features/Products/data/base/base_local_products_data_source.dart';
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
}
