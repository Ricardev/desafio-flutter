import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:starwiki/core/erro/errors.dart';
import 'package:starwiki/core/erro/exceptions.dart';
import 'package:starwiki/features/characters/data/datasource/i_star_wars_datasource.dart';
import 'package:starwiki/features/characters/data/model/character_model.dart';
import 'package:starwiki/features/characters/data/model/people_info_model.dart';
import 'package:starwiki/features/characters/data/repository/star_wars_repository.dart';
import 'package:starwiki/features/characters/domain/usecase/get_character_usecase.dart';

class MockStarWarsDatasource extends Mock implements IStarWarsDatasource {}

void main() {
  late StarWarsRepository repository;
  late IStarWarsDatasource datasource;
  setUp(() {
    datasource = MockStarWarsDatasource();
    repository = StarWarsRepository(starWarsDatasource: datasource);
  });
  const tGetCharactersParams = GetCharactersParams(page: '1');
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

  test('Retorna uma lista de CharacterModel', () async {
    when(() => datasource.getCharactersFromData(tGetCharactersParams))
        .thenAnswer((_) async => (tPeopleInfoModel));
    final result = await repository.getCharacters(tGetCharactersParams);
    expect(result, const Right<Error, PeopleInfoModel>(tPeopleInfoModel));
    verify(() => datasource.getCharactersFromData(tGetCharactersParams)).called(1);
  });

  test('Retorna um exception', () async {
    when(() => datasource.getCharactersFromData(tGetCharactersParams))
        .thenThrow(ServerException());
    final result = await repository.getCharacters(tGetCharactersParams);
    expect(result, Left(ServerError()));
    verify(() => datasource.getCharactersFromData(tGetCharactersParams)).called(1);
  });
}
