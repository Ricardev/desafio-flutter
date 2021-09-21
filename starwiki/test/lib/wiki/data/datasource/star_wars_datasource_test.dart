import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:starwiki/core/request_service/service.dart';
import 'package:starwiki/features/characters/data/datasource/i_star_wars_datasource.dart';
import 'package:starwiki/features/characters/data/datasource/star_wars_datasource.dart';
import 'package:starwiki/features/characters/data/model/character_model.dart';
import 'package:starwiki/features/characters/data/model/people_info_model.dart';

class MockRequestProvider extends Mock implements IRequestProvider {}

void main() {
  late IRequestProvider requestProvider;
  late IStarWarsDatasource datasource;
  setUp(() {
    requestProvider = MockRequestProvider();
    datasource = StarWarsDatasource(requestProvider: requestProvider);
  });
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
  const tPeopleInfoModel = PeopleInfoModel(
    count: 81,
    next: 'next',
    previous: 'previous',
    characters: [tCharacterModel],
  );
}
