abstract class DataBaseHelper {
  Future<int> delete(String table, {String? column, List? whereArgs});

  Future<List<T>> getAll<T>(
      String tabela, T Function(Map<String, dynamic> p1) funcaoDeConversao,
      {String? where, List? whereArgs, String? orderBy});

  Future getTable(String table);

  Future getValueById<T>(String table, String id,
      T Function(Map<String, dynamic>) funcaoDeConversao);

  Future<int> insert(String tabela, Map<String, dynamic> objeto);

  Future<int> insertList(String tabela, List<Map<String, dynamic>> maps);

  Future<int> update(
      String tabela, Map<String, dynamic> map, valor, String campo);

  Future initDataBase(String nomeDB, int versaoDB, List<String> queries);
}
