import 'package:starwiki/features/characters/data/model/people_info_model.dart';
import 'package:starwiki/features/characters/data/model/planet_model.dart';
import 'package:starwiki/features/characters/data/model/specie_model.dart';
import 'package:starwiki/features/characters/domain/usecase/get_character_usecase.dart';

abstract class IStarWarsDatasource {
  Future<PeopleInfoModel> getCharactersFromData(GetCharactersParams params);
  Future<PlanetModel> getCharacterPlanet(String planetUrl);
  Future<SpecieModel> getCharacterSpecie(String specieUrl);
}
