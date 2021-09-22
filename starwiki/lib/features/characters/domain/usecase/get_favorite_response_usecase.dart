import 'package:starwiki/features/characters/domain/entity/favorities_entity.dart';
import 'package:starwiki/features/characters/domain/repository/i_star_wars_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:starwiki/core/erro/errors.dart';

class GetCharacterFavoriteUsecase {
  final IStarWarsRepository starWarsRepository;

  GetCharacterFavoriteUsecase({required this.starWarsRepository});

  Future<Either<Error, FavoritiesEntity>> call(int id) async {
    return await starWarsRepository.getFavoriteResponse(id);
  }
}
