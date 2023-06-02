import 'package:products_task/core/constants/app_strings.dart';

class DatebaseQueries {
  static const String selectAllFromTable = 'SELECT * FROM ';
  static const String createTableQuery =
      'CREATE TABLE Products (id INTEGER PRIMARY KEY AUTOINCREMENT, ${AppStrings.productName} TEXT, ${AppStrings.productPrice} INTEGER, ${AppStrings.productImage} BLOB)';
  static const String deleteFromTable = 'DELETE FROM ';
  static const String whereId = ' WHERE id = ';

  static String updateTable(String tableName) =>
      'UPDATE $tableName SET ${AppStrings.productName}= ?, ${AppStrings.productPrice}= ?, ${AppStrings.productImage}= ? WHERE ${AppStrings.id} = ?';
}
