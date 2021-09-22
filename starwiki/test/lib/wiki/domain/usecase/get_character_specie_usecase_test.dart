import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:starwiki/core/erro/errors.dart';
import 'package:starwiki/features/characters/domain/entity/people_info_entity.dart';
import 'package:starwiki/features/characters/domain/entity/specie_entity.dart';
import 'package:starwiki/features/characters/domain/repository/i_star_wars_repository.dart';
import 'package:starwiki/features/characters/domain/usecase/get_character_specie_usecase.dart';

class MockStarWarsRepository extends Mock implements IStarWarsRepository {}

void main() {
  late GetCharacterSpecieUsecase getCharacterSpecieUsecase;
  late IStarWarsRepository repository;

  setUp(() {
    repository = MockStarWarsRepository();
    getCharacterSpecieUsecase = GetCharacterSpecieUsecase(starWarsRepository: repository);
  });
  const tSpecieEntity = SpecieEntity(specieName: 'specieName');
  test('Deve retornar um SpecieEntity, ao pegar as informações do repository',
      () async {
    when(() => repository.getCharacterSpecie('specieUrl'))
        .thenAnswer((_) async => const Right(tSpecieEntity));
    final result = await getCharacterSpecieUsecase.call('specieUrl');
    expect(result, const Right<Error, SpecieEntity>(tSpecieEntity));
    verify(() => repository.getCharacterSpecie('specieUrl'));
  });

  test('Deve retornar um Error no retorno do usecase', () async {
    when(() => repository.getCharacterSpecie('specieUrl'))
        .thenAnswer((_) async => Left(ServerError()));
    final result = await getCharacterSpecieUsecase.call('specieUrl');
    expect(result, Left<Error, PeopleInfoEntity>(ServerError()));
    verify(() => repository.getCharacterSpecie('specieUrl'));
  });
}
