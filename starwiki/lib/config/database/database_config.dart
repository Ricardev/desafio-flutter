// import '../../core/data_base_helper/lib/data_base_h.dart';
// import '../injector/injector.dart';

// class DataBaseConfig {
//   DataBaseHelper? _db;
//   static DataBaseConfig? _dbc;

//   static DataBaseConfig get instance {
//     return _dbc ?? DataBaseConfig();
//   }

//   DataBaseConfig() {
//     _db = injector.get<DataBaseHelper>();
//   }

//   Future criarBanco() async {
//     await _db?.initDataBase('dashboard_sprints_db', 1, _getQueries());
//   }

//   List<String> _getQueries() {
//     return [
//       CreateTableQueries.favorites,
//     ];
//   }
// }
