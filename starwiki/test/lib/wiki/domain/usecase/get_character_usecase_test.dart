import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:starwiki/core/erro/errors.dart';
import 'package:starwiki/wiki/domain/entity/character_entity.dart';
import 'package:starwiki/wiki/domain/repository/i_star_wars_repository.dart';
import 'package:starwiki/wiki/domain/usecase/get_character_usecase.dart';

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
    height: 10,
    mass: 10,
    hairColor: 'hairColor',
    skinColor: 'skinColor',
    eyeColor: 'eyeColor',
    birthYear: 'birthYear',
    gender: 'gender',
    homeWorld: 'homeWorld',
    specie: ['specie'],
  );
  test(
      'Deve retornar um character entity, ao pegar as informações do repository',
      () async {
    when(() => repository.getCharacter())
        .thenAnswer((_) async => const Right([tCharacterEntity]));
    final result = await getCharacterUsecase.call();
    expect(
        result, const Right<Erro, List<CharacterEntity>>([tCharacterEntity]));
    verify(() => repository.getCharacter());
  });
}
