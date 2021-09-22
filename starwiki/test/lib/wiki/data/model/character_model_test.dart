import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:starwiki/features/characters/data/model/character_model.dart';
import 'package:starwiki/features/characters/data/model/people_info_model.dart';
import 'package:starwiki/features/characters/domain/entity/character_entity.dart';

import '../../../../mock/people_info_mock.dart';

void main() {
  const tCharacterModel = CharacterModel(
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
 
 

  test('Tem que ser subclasse CharacterEntity', () {
    expect(tCharacterModel, isA<CharacterEntity>());
  });

  test('Tem que retornar um modelo válido', () {
    final Map<String, dynamic> jsonMap = json.decode(peopleInfoMock);
    final result = PeopleInfoModel.fromJson(jsonMap);
    expect(result.characters.first, tCharacterModel);
  });
 
}
