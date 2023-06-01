import 'package:dartz/dartz.dart';
import 'package:products_task/core/constants/params.dart';
import 'package:products_task/core/error/failure.dart';

abstract class BaseProductsRepository {
  Future<Either<Failure, void>> initDataBase(InitDatabaseParams params);
}
