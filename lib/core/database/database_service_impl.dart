import 'dart:async';

import 'package:path/path.dart';
import 'package:products_task/core/constants/app_strings.dart';
import 'package:products_task/core/constants/constant.dart';
import 'package:sqflite/sqflite.dart';

import 'base_database_service.dart';
import 'datebase_queries.dart';

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
    List<Map<String, Object?>> convertedData = [];
    final List<Map<String, Object?>> data =
        await database.rawQuery(DatebaseQueries.selectAllFromTable + tableName);
    for (var row in data) {
      final imageFile = await Constants.generateFileForimage(row);
      convertedData.add({
        AppStrings.id: row[AppStrings.id],
        AppStrings.productName: row[AppStrings.productName],
        AppStrings.productPrice: row[AppStrings.productPrice],
        AppStrings.productImage: imageFile,
      });
    }
    return convertedData;
  }

  @override
  Future<int> deleteDataFromDatabaseById(
      {required int id, required String tableName}) async {
    return await database.rawDelete(
      DatebaseQueries.deleteFromTable +
          tableName +
          DatebaseQueries.whereId +
          id.toString(),
    );
  }

  @override
  Future<int> deleteAllDataFromDatabase({required String tableName}) async {
    return await database
        .rawDelete(DatebaseQueries.deleteFromTable + tableName);
  }

  @override
  Future<int> insertIntoDataBase(
      {required Map<String, dynamic> data, required String tableName}) async {
    return await database.insert(
      tableName,
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
