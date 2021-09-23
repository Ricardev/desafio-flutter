import 'package:get_it/get_it.dart';
import 'package:starwiki/config/database/database_helper.dart';
import 'package:starwiki/config/database/database_queries.dart';
import 'package:starwiki/core/request_service/i_request_provider.dart';
import 'package:starwiki/core/request_service/request_provider.dart';
import 'package:starwiki/features/characters/data/datasource/i_star_wars_datasource.dart';
import 'package:starwiki/features/characters/data/datasource/star_wars_datasource.dart';
import 'package:starwiki/features/characters/data/repository/star_wars_repository.dart';
import 'package:starwiki/features/characters/domain/repository/i_star_wars_repository.dart';
import 'package:starwiki/features/characters/domain/usecase/get_character_planet_usecase.dart';
import 'package:starwiki/features/characters/domain/usecase/get_character_search_usecase.dart';
import 'package:starwiki/features/characters/domain/usecase/get_character_specie_usecase.dart';
import 'package:starwiki/features/characters/domain/usecase/get_character_usecase.dart';
import 'package:starwiki/features/characters/domain/usecase/get_favorite_response_usecase.dart';
import 'package:starwiki/features/characters/presentation/bloc/character_detail/character_detail_bloc.dart';
import 'package:starwiki/features/characters/presentation/bloc/characters_list_bloc.dart';

GetIt injector = GetIt.instance;

Future<void> init() async {
  injector.registerFactory<DataBaseHelper>(() => DatabaseHelperQueries());
  injector.registerFactory<IRequestProvider>(() => RequestProvider());
  injector.registerFactory<IStarWarsDatasource>(
    () => StarWarsDatasource(
      requestProvider: injector(),
    ),
  );
  injector.registerFactory<IStarWarsRepository>(
      () => StarWarsRepository(starWarsDatasource: injector()));
  injector.registerLazySingleton(
      () => GetCharacterUsecase(starWarsRepository: injector()));
  injector.registerLazySingleton(
      () => GetCharacterPlanetUsecase(starWarsRepository: injector()));
  injector.registerLazySingleton(
      () => GetCharacterSpecieUsecase(starWarsRepository: injector()));
  injector.registerLazySingleton(
      () => GetCharacterFavoriteUsecase(starWarsRepository: injector()));
  injector.registerLazySingleton(
      () => GetCharacterSearchUsecase(starWarsRepository: injector()));
  injector.registerLazySingleton(() => CharacterDetailBloc(
      planetUseCase: injector(), specieUseCase: injector()));
  injector.registerLazySingleton(() => CharactersListBloc(
      getCharacterUsecase: injector(),
      getCharacterFavoriteUsecase: injector(),
      searchUsecase: injector()));
}
