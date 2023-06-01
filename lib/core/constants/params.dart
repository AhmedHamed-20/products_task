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
