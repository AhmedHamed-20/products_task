abstract class BaseDataBaseService {
  Future<void> init(
      {required String databasesName,
      required int version,
      required String query});
  Future<void> close();
  Future<List<Map<String, Object?>>> getAllDataFromDatabase(String tableName);
  Future<int> deleteDataFromDatabaseById(
      {required int id, required String tableName});
  Future<int> deleteAllDataFromDatabase({required String tableName});
  Future<int> insertIntoDataBase(
      {required Map<String, dynamic> data, required String tableName});
  Future<int> updateDataBase(String query, List arguments);
}
