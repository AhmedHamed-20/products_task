import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:products_task/core/constants/app_strings.dart';
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
      final imageFile = await _generateFileForimage(row);
      convertedData.add({
        AppStrings.productName: row[AppStrings.productName],
        AppStrings.productPrice: row[AppStrings.productPrice],
        AppStrings.productImage: imageFile,
      });
    }
    return convertedData;
  }

  Future<File> _generateFileForimage(Map<String, Object?> row) async {
    var imgBytes = row[AppStrings.productImage] as List<int>;
    var fileName = 'image_${row['id']}.png'; // Generate unique file name
    var imageFile = await _getLocalFilePath(fileName); // Get the local file
    await imageFile.writeAsBytes(imgBytes);
    return imageFile;
  }

  Future<File> _getLocalFilePath(String fileName) async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, fileName);
    return File(path);
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
