import 'package:products_task/core/constants/app_strings.dart';

class DatebaseQueries {
  static const String selectAllFromTable = 'SELECT * FROM ';
  static const String createTableQuery =
      'CREATE TABLE Products (id INTEGER PRIMARY KEY AUTOINCREMENT, ${AppStrings.productName} TEXT, ${AppStrings.productPrice} INTEGER, ${AppStrings.productImage} BLOB)';
}
