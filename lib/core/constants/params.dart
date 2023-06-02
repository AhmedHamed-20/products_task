import 'package:equatable/equatable.dart';

class InitDatabaseParams extends Equatable {
  final String databasesName;
  final int version;
  final String query;

  const InitDatabaseParams(
      {required this.databasesName,
      required this.version,
      required this.query});

  @override
  List<Object?> get props => [databasesName, version, query];
}

class InsertProductParams extends Equatable {
  final String tableName;
  final Map<String, dynamic> data;
  const InsertProductParams({required this.tableName, required this.data});

  @override
  List<Object?> get props => [tableName, data];
}

class GetAllProductsParams extends Equatable {
  final String tableName;
  const GetAllProductsParams({required this.tableName});

  @override
  List<Object?> get props => [tableName];
}

class UpdateProductParams extends Equatable {
  final String query;
  final List<dynamic> args;

  const UpdateProductParams(this.query, this.args);

  @override
  List<Object?> get props => [query, args];
}

class UpdateProductTextFieldsParams extends Equatable {
  final String productName;
  final int productPrice;

  const UpdateProductTextFieldsParams({
    required this.productName,
    required this.productPrice,
  });

  @override
  List<Object?> get props => [productName, productPrice];
}

class DeleteProductParams extends Equatable {
  final String tableName;
  final int id;

  const DeleteProductParams({required this.tableName, required this.id});

  @override
  List<Object?> get props => [tableName, id];
}
