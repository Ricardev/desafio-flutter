import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:starwiki/core/erro/errors.dart';
import 'package:starwiki/features/characters/domain/entity/people_info_entity.dart';
import 'package:starwiki/features/characters/domain/entity/planet_entity.dart';
import 'package:starwiki/features/characters/domain/repository/i_star_wars_repository.dart';
import 'package:starwiki/features/characters/domain/usecase/get_character_planet_usecase.dart';

class MockStarWarsRepository extends Mock implements IStarWarsRepository {}

void main() {
  late GetCharacterPlanetUsecase getCharacterPlanetUsecase;
  late IStarWarsRepository repository;

  setUp(() {
    repository = MockStarWarsRepository();
    getCharacterPlanetUsecase = GetCharacterPlanetUsecase(starWarsRepository: repository);
  });
  const tPlanetEntity = PlanetEntity(planetName: 'planetName');
  test('Deve retornar um PlanetEntity, ao pegar as informações do repository',
      () async {
    when(() => repository.getCharacterPlanet('planetUrl'))
        .thenAnswer((_) async => const Right(tPlanetEntity));
    final result = await getCharacterPlanetUsecase.call('planetUrl');
    expect(result, const Right<Error, PlanetEntity>(tPlanetEntity));
    verify(() => repository.getCharacterPlanet('planetUrl'));
  });

  test('Deve retornar um Error no retorno do usecase', () async {
    when(() => repository.getCharacterPlanet('planetUrl'))
        .thenAnswer((_) async => Left(ServerError()));
    final result = await getCharacterPlanetUsecase.call('planetUrl');
    expect(result, Left<Error, PeopleInfoEntity>(ServerError()));
    verify(() => repository.getCharacterPlanet('planetUrl'));
  });
}
