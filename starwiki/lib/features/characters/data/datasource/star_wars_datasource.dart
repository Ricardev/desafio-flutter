import 'package:starwiki/core/request_service/service.dart';
import 'package:starwiki/features/characters/data/datasource/i_star_wars_datasource.dart';
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
  Future<PlanetModel> getCharacterPlanet(String planetUrl) {
    final response =
        requestProvider.getAsync<PlanetModel>(planetUrl, PlanetModel.fromJson);
    return response;
  }

  @override
  Future<SpecieModel> getCharacterSpecie(String specieUrl) {
    final response =
        requestProvider.getAsync<SpecieModel>(specieUrl, SpecieModel.fromJson);
    return response;
  }
}
