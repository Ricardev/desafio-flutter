import 'dart:math';

import 'package:starwiki/core/request_service/service.dart';
import 'package:starwiki/features/characters/data/datasource/i_star_wars_datasource.dart';
import 'package:starwiki/features/characters/data/model/favorities_model.dart';
import 'package:starwiki/features/characters/data/model/people_info_model.dart';
import 'package:starwiki/features/characters/data/model/planet_model.dart';
import 'package:starwiki/features/characters/data/model/specie_model.dart';
import 'package:starwiki/features/characters/domain/usecase/get_character_usecase.dart';

class StarWarsDatasource extends IStarWarsDatasource {
  final IRequestProvider requestProvider;
  final String urlBase = "https://swapi.dev/api";
  StarWarsDatasource({required this.requestProvider});
  @override
  Future<PeopleInfoModel> getCharactersFromData(
      GetCharactersParams params) async {
    String url = "$urlBase/people?page=${params.page}";
    final response = await requestProvider.getAsync<PeopleInfoModel>(
        url, PeopleInfoModel.fromJson);
    return response;
  }

  @override
  Future<PlanetModel> getCharacterPlanet(String planetUrl) async {
    final response = await requestProvider.getAsync<PlanetModel>(
        planetUrl, PlanetModel.fromJson);
    return response;
  }

  @override
  Future<SpecieModel> getCharacterSpecie(String specieUrl) async {
    final response = await requestProvider.getAsync<SpecieModel>(
        specieUrl, SpecieModel.fromJson);
    return response;
  }

  @override
  Future<FavoritiesModel> favoriteCharacter(int id) async {
    Random random = Random();
    if (random.nextInt(2) != 0) {
      requestProvider.setHeaders({"prefer": 'status=400'});
    }

    final response = await requestProvider.postAsync(
        'http://private-anon-d667d37bc0-starwarsfavorites.apiary-mock.com/favorite/$id',
        null,
        FavoritiesModel.fromJson);
    return response;
  }

  @override
  Future<PeopleInfoModel> getCharacterSearch(String name) async {
    String url = "$urlBase/people/?search=$name";
    final response = await requestProvider.getAsync<PeopleInfoModel>(
        url, PeopleInfoModel.fromJson);
    return response;
  }
}
