import 'package:starwiki/features/characters/domain/entity/specie_entity.dart';
import 'package:starwiki/features/characters/domain/repository/i_star_wars_repository.dart';
import 'package:starwiki/core/erro/errors.dart';
import 'package:dartz/dartz.dart';

class GetCharacterSpecieUsecase {
  final IStarWarsRepository starWarsRepository;

  GetCharacterSpecieUsecase({required this.starWarsRepository});

  
  Future<Either<Error, SpecieEntity>> call(String specieUrl) async {
    return await starWarsRepository.getCharacterSpecie(specieUrl);
  }
}