import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:starwiki/core/erro/errors.dart';
import 'package:starwiki/features/characters/domain/entity/character_entity.dart';
import 'package:starwiki/features/characters/domain/entity/people_info_entity.dart';
import 'package:starwiki/features/characters/domain/repository/i_star_wars_repository.dart';
import 'package:starwiki/features/characters/domain/usecase/get_character_usecase.dart';

class MockStarWarsRepository extends Mock implements IStarWarsRepository {}

void main() {
  late GetCharacterUsecase getCharacterUsecase;
  late IStarWarsRepository repository;

  setUp(() {
    repository = MockStarWarsRepository();
    getCharacterUsecase = GetCharacterUsecase(starWarsRepository: repository);
  });

  const tCharacterEntity = CharacterEntity(
    name: 'name',
    height: '10',
    mass: '10',
    hairColor: 'hairColor',
    skinColor: 'skinColor',
    eyeColor: 'eyeColor',
    birthYear: 'birthYear',
    gender: 'gender',
    homeWorld: 'homeWorld',
    specie: ['specie'],
  );

  const tPeopleInfoEntity = PeopleInfoEntity(
      count: 82,
      next: 'null',
      previous: 'https://swapi.dev/api/people/?page=8',
      characters: [tCharacterEntity]);
  test(
      'Deve retornar um character entity, ao pegar as informações do repository',
      () async {
    when(() => repository.getCharacters(any()))
        .thenAnswer((_) async => const Right(tPeopleInfoEntity));
    final result = await getCharacterUsecase.call(any());
    expect(result, const Right<Error, PeopleInfoEntity>(tPeopleInfoEntity));
    verify(() => repository.getCharacters(any()));
  });

  test('Deve retornar um Error no retorno do usecase', () async {
    when(() => repository.getCharacters(any()))
        .thenAnswer((_) async => Left(ServerError()));
    final result = await getCharacterUsecase.call(any());
    expect(result, Left<Error, PeopleInfoEntity>(ServerError()));
    verify(() => repository.getCharacters(any()));
  });
}
