import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:starwiki/features/characters/data/model/character_model.dart';
import 'package:starwiki/features/characters/data/model/people_info_model.dart';
import 'package:starwiki/features/characters/domain/entity/people_info_entity.dart';

import '../../../../mock/people_info_mock.dart';

void main() {
  const tCharacterModel1 = CharacterModel(
    name: 'Sly Moore',
    height: '178',
    mass: '48',
    hairColor: 'none',
    skinColor: 'pale',
    eyeColor: 'white',
    birthYear: 'unknown',
    gender: 'female',
    homeWorld: 'https://swapi.dev/api/planets/60/',
    specie: [],
  );
  const tCharacterModel2 = CharacterModel(
    name: 'Tion Medon',
    height: '206',
    mass: '80',
    hairColor: 'none',
    skinColor: 'grey',
    eyeColor: 'black',
    birthYear: 'unknown',
    gender: 'male',
    homeWorld: 'https://swapi.dev/api/planets/12/',
    specie: ['https://swapi.dev/api/species/37/'],
  );
  const tPeopleInfoModel = PeopleInfoModel(
    count: 82,
    next: 'last',
    previous: 'https://swapi.dev/api/people/?page=8',
    characters: [
      tCharacterModel1,
      tCharacterModel2,
    ],
  );

  test('Tem que ser subclasse PeopleInfoEntity', () {
    expect(tPeopleInfoModel, isA<PeopleInfoEntity>());
  });

  test('Tem que retornar um modelo válido', () {
    final Map<String, dynamic> jsonMap = json.decode(peopleInfoMock);
    final result = PeopleInfoModel.fromJson(jsonMap);
    expect(result, tPeopleInfoModel);
  });
 
}
