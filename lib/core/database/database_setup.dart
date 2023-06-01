import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'base_database_service.dart';

class DatabaseProvider implements BaseDataBaseService {
  late Database database;
  @override
  Future init(
      {required String databasesName,
      required int version,
      required String query}) async {
    final databasesPath = await getDatabasesPath();
    String path = join(databasesPath, databasesName);
    database = await openDatabase(path, version: version,
        onCreate: (Database db, int version) async {
      await db.execute(query);
    }, onOpen: (createdDatabase) async {
      database = createdDatabase;
    });
  }

  @override
  Future<List<Map<String, Object?>>> getAllDataFromDatabase(
      String tableName) async {
    return await database.rawQuery('SELECT * FROM $tableName');
  }

  @override
  Future<int> deleteDataFromDatabaseById(
      {required int id, required String tableName}) async {
    return await database
        .rawDelete('DELETE FROM $tableName WHERE  dataBaseId=$id');
  }

  @override
  Future<int> deleteAllDataFromDatabase({required String tableName}) async {
    return await database.rawDelete('DELETE FROM $tableName');
  }

  @override
  Future<void> insertIntoDataBase(
      {required List<Object?> data, required String query}) async {
    await database.execute(
      query,
      data,
    );
  }

  @override
  Future<int> updateDataBase(String query, List arguments) async {
    return await database.rawUpdate(query, arguments);
  }

  @override
  Future close() async => database.close();
}
