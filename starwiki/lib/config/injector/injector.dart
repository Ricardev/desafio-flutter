import 'package:get_it/get_it.dart';
import 'package:starwiki/core/export.dart';
import 'package:starwiki/features/characters/data/datasource/i_star_wars_datasource.dart';
import 'package:starwiki/features/characters/data/datasource/star_wars_datasource.dart';
import 'package:starwiki/features/characters/data/repository/star_wars_repository.dart';
import 'package:starwiki/features/characters/domain/repository/i_star_wars_repository.dart';
import '../../core/data_base_helper/lib/data_base_h.dart';
import '../../core/request_service/lib/i_request_provider.dart';

GetIt injector = GetIt.instance;

Future<void> init() async {
  injector.registerFactory<IRequestProvider>(() => RequestProvider());
  injector.registerFactory<IStarWarsRepository>(
      () => StarWarsRepository(starWarsDatasource: injector()));
  injector.registerFactory<IStarWarsDatasource>(
      () => StarWarsDatasource(injector()));
  injector.registerFactory<DataBaseHelper>(() => DatabaseHelperQueries());
}
