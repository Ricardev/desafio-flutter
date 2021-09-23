import 'package:starwiki/config/database/queries.dart';

import '../injector/injector.dart';
import 'database_helper.dart';

class DataBaseConfig {
  DataBaseHelper? _db;
  static DataBaseConfig? _dbc;

  static DataBaseConfig get instance {
    return _dbc ?? DataBaseConfig();
  }

  DataBaseConfig() {
    _db = injector.get<DataBaseHelper>();
  }

  Future criarBanco() async {
    await _db?.initDataBase('starwiki_db', 1, _getQueries());
  }

  List<String> _getQueries() {
    return [
      CreateTableQueries.favorites,
    ];
  }
}
