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
