import 'package:starwiki/features/characters/domain/entity/planet_entity.dart';
import 'package:starwiki/features/characters/domain/repository/i_star_wars_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:starwiki/core/erro/errors.dart';

class GetCharacterPlanetUsecase {
  final IStarWarsRepository starWarsRepository;

  GetCharacterPlanetUsecase({required this.starWarsRepository});

  Future<Either<Error, PlanetEntity>> call(String planetUrl) async {
    return await starWarsRepository.getCharacterPlanet(planetUrl);
  }
}
