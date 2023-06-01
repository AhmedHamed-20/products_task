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
  Future<void> insertIntoDataBase(
      {required List<Object?> data, required String query});
  Future<int> updateDataBase(String query, List arguments);
}
