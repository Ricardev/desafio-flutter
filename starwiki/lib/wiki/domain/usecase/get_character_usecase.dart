import 'package:starwiki/core/erro/errors.dart';
import 'package:starwiki/wiki/domain/entity/character_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:starwiki/wiki/domain/repository/i_star_wars_repository.dart';

class GetCharacterUsecase {
  final IStarWarsRepository starWarsRepository;

  GetCharacterUsecase({required this.starWarsRepository});
  Future<Either<Erro, List<CharacterEntity>>> call() async {
    return await starWarsRepository.getCharacter();
  }
}
