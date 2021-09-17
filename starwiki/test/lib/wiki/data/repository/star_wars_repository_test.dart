import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:starwiki/core/erro/errors.dart';
import 'package:starwiki/core/erro/exceptions.dart';
import 'package:starwiki/wiki/data/datasource/star_wars_datasource.dart';
import 'package:starwiki/wiki/data/model/character_model.dart';
import 'package:starwiki/wiki/data/model/people_info_model.dart';
import 'package:starwiki/wiki/data/repository/star_wars_repository.dart';

class MockStarWarsDatasource extends Mock implements StarWarsDatasource {}

void main() {
  late StarWarsRepository repository;
  late StarWarsDatasource datasource;
  setUp(() {
    datasource = MockStarWarsDatasource();
    repository = StarWarsRepository(starWarsDatasource: datasource);
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

  test('Retorna uma lista de CharacterModel', () async {
    when(() => datasource.getCharactersFromData())
        .thenAnswer((_) async => (tPeopleInfoModel));
    final result = await repository.getCharacters();
    expect(result, const Right<Error, PeopleInfoModel>(tPeopleInfoModel));
    verify(() => datasource.getCharactersFromData()).called(1);
  });

  test('Retorna um exception', () async {
    // Arrange
    when(() => datasource.getCharactersFromData()).thenThrow(ServerException());
    // Act
    final result = await repository.getCharacters();
    // Assert
    expect(result, Left(ServerError()));
    verify(() => datasource.getCharactersFromData()).called(1);
  });
}
