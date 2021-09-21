import 'package:get_it/get_it.dart';
import 'package:starwiki/core/database/data_base_h.dart';
import 'package:starwiki/core/request_service/i_request_provider.dart';
import 'package:starwiki/core/request_service/request_provider.dart';
import 'package:starwiki/features/characters/data/datasource/i_star_wars_datasource.dart';
import 'package:starwiki/features/characters/data/datasource/star_wars_datasource.dart';
import 'package:starwiki/features/characters/data/repository/star_wars_repository.dart';
import 'package:starwiki/features/characters/domain/repository/i_star_wars_repository.dart';
import 'package:starwiki/features/characters/domain/usecase/get_character_usecase.dart';
import 'package:starwiki/features/characters/presentation/bloc/characters_list_bloc.dart';

GetIt injector = GetIt.instance;

Future<void> init() async {
  injector.registerFactory<IRequestProvider>(()  => RequestProvider());
  injector.registerFactory<IStarWarsDatasource>(
    () => StarWarsDatasource(
      requestProvider: injector(),
    ),
  );
  injector.registerFactory<IStarWarsRepository>(
      () => StarWarsRepository(starWarsDatasource: injector()));
  injector.registerLazySingleton(
      () => GetCharacterUsecase(starWarsRepository: injector()));
  injector.registerFactory<DataBaseHelper>(() => DatabaseHelperQueries());
  injector.registerLazySingleton(
      () => CharactersListBloc(getCharacterUsecase: injector()));
}
