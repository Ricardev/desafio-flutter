import 'package:starwiki/core/usecases/usecases.dart';
import 'package:starwiki/features/characters/domain/entity/favorities_entity.dart';
import 'package:starwiki/features/characters/domain/repository/i_star_wars_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:starwiki/core/erro/errors.dart';
import 'package:equatable/equatable.dart';

class GetCharacterFavoriteUsecase
    implements UseCase<FavoritiesEntity, FavoriteParams> {
  final IStarWarsRepository starWarsRepository;

  GetCharacterFavoriteUsecase({required this.starWarsRepository});

  @override
  Future<Either<Error, FavoritiesEntity>> call(FavoriteParams params) async {
    return await starWarsRepository.getFavoriteResponse(params.id);
  }
}

class FavoriteParams extends Equatable {
  final int id;
  const FavoriteParams({required this.id});

  @override
  List<Object?> get props => [id];
}
