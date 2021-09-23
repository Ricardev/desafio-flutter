import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:starwiki/core/request_service/service.dart';
import 'package:starwiki/features/characters/data/datasource/i_star_wars_datasource.dart';
import 'package:starwiki/features/characters/data/datasource/star_wars_datasource.dart';
import 'package:starwiki/features/characters/data/model/character_model.dart';
import 'package:starwiki/features/characters/data/model/people_info_model.dart';
import 'package:starwiki/features/characters/data/model/planet_model.dart';
import 'package:starwiki/features/characters/data/model/specie_model.dart';
import 'package:starwiki/features/characters/domain/usecase/get_character_usecase.dart';

class MockRequestProvider extends Mock implements IRequestProvider {}

void main() {
  late IRequestProvider requestProvider;
  late IStarWarsDatasource datasource;
  setUp(() {
    requestProvider = MockRequestProvider();
    datasource = StarWarsDatasource(requestProvider: requestProvider);
  });
  const tGetCharactersParams = GetCharactersParams(page: 1);
  const tCharacterModel = CharacterModel(
    name: 'name',
    height: '122',
    mass: '110',
    hairColor: 'hairColor',
    skinColor: 'skinColor',
    eyeColor: 'eyeColor',
    birthYear: 'birthYear',
    gender: 'gender',
    homeWorld: 'homeWorld',
    specie: ['specie'],
  );

  test(
    'tem que chamar o método correto com a url correta ao chamar os personagens',
    () async {
      when(() => requestProvider.getAsync(any()))
          .thenAnswer((_) async => const PeopleInfoModel(
                characters: [tCharacterModel],
                count: 81,
                next: '',
                previous: '',
              ));

      await datasource.getCharactersFromData(tGetCharactersParams);

      verify(() =>
          requestProvider.getAsync("https://swapi.dev/api/people?page=1"));
    },
  );
  test(
    'tem que chamar o método correto com a url correta ao chamar a specie',
    () async {
      when(() => requestProvider.getAsync(any()))
          .thenAnswer((_) async => const SpecieModel(specieName: 'specieName'));

      await datasource.getCharacterSpecie('specieUrl');

      verify(() => requestProvider.getAsync("specieUrl"));
    },
  );
  test(
    'tem que chamar o método correto com a url correta ao chamar a planet',
    () async {
      when(() => requestProvider.getAsync(any()))
          .thenAnswer((_) async => const PlanetModel(planetName: 'planetName'));

      await datasource.getCharacterPlanet('planetUrl');

      verify(() => requestProvider.getAsync("planetUrl"));
    },
  );
}
