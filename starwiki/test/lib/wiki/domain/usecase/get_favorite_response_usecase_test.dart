import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:starwiki/core/erro/errors.dart';
import 'package:starwiki/features/characters/domain/entity/favorities_entity.dart';
import 'package:starwiki/features/characters/domain/repository/i_star_wars_repository.dart';
import 'package:starwiki/features/characters/domain/usecase/get_favorite_response_usecase.dart';

class MockStarWarsRepository extends Mock implements IStarWarsRepository {}

void main() {
  late GetCharacterFavoriteUsecase getCharacterFavoriteUsecase;
  late IStarWarsRepository repository;

  setUp(() {
    repository = MockStarWarsRepository();
    getCharacterFavoriteUsecase =
        GetCharacterFavoriteUsecase(starWarsRepository: repository);
  });
  const tFavoriteEntity =
      FavoritiesEntity(message: 'sucess', status: 'May the force be with you');
  test('Deve retornar um FavoriteEntity, ao pegar as informações do repository',
      () async {
    when(() => repository.getFavoriteResponse(1))
        .thenAnswer((_) async => const Right(tFavoriteEntity));
    final result =
        await getCharacterFavoriteUsecase.call(const FavoriteParams(id: 1));
    expect(result, const Right<Error, FavoritiesEntity>(tFavoriteEntity));
    verify(() => repository.getFavoriteResponse(1));
  });

  test('Deve retornar um Error no retorno do usecase', () async {
    when(() => repository.getFavoriteResponse(1))
        .thenAnswer((_) async => Left(ServerError()));
    final result =
        await getCharacterFavoriteUsecase.call(const FavoriteParams(id: 1));
    expect(result, Left<Error, FavoritiesEntity>(ServerError()));
    verify(() => repository.getFavoriteResponse(1));
  });
}
