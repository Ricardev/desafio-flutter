import 'dart:async';
import 'package:flutter/cupertino.dart';

import 'custom_sqflite.dart';
import 'database_helper.dart';

class DatabaseHelperQueries implements DataBaseHelper {
  static DatabaseHelperQueries? _instance;

  factory DatabaseHelperQueries() {
    _instance ??= DatabaseHelperQueries._internalConstructor();
    return _instance!;
  }

  DatabaseHelperQueries._internalConstructor();

  @override
  Future initDataBase(String nomeDB, int versaoDB, List<String> queries) async {
    debugPrint('criação do banco: $nomeDB ' + versaoDB.toString());
    try {
      await CustomSqflite.instance.carregarBanco(nomeDB, versaoDB, queries);
    } on Exception catch (error) {
      debugPrint(error.toString());
    }
  }

  @override
  Future<int> insert(String tabela, Map<String, dynamic> objeto) async {
    debugPrint('Inserção da tabela: ' + tabela);
    int resultado = -1;
    resultado = await CustomSqflite.instance.db!.insert(tabela, objeto);

    return resultado;
  }

  @override
  Future<T> getValueById<T>(String table, String id,
      T Function(Map<String, dynamic>) funcaoDeConversao) async {
    debugPrint('get da tabela: ' + table + ' com o Id: ' + id);
    List<Map<String, dynamic>> dadosDoBanco = await CustomSqflite.instance.db!
        .rawQuery('SELECT * FROM $table  WHERE id == "$id"');

    return funcaoDeConversao(dadosDoBanco.first);
  }

  @override
  Future<List<T>> getAll<T>(
      String tabela, T Function(Map<String, dynamic>) funcaoDeConversao,
      {String? where, List<dynamic>? whereArgs, String? orderBy}) async {
    debugPrint('get all da tabela: ' + tabela);
    var dadosDoBanco = await CustomSqflite.instance.db!
        .query(tabela, where: where, whereArgs: whereArgs, orderBy: orderBy);

    List<T> result = [];
    for (Map<String, dynamic> item in dadosDoBanco) {
      result.add(funcaoDeConversao(item));
    }
    return result;
  }

  @override
  Future<int> delete(String table, {String? column, List? whereArgs}) async {
    debugPrint('delete da tabela: ' + table + 'na column ' + '$column');
    return await CustomSqflite.instance.db!.delete(
      table,
      where: '$column = ?',
      whereArgs: whereArgs,
    );
  }
}
