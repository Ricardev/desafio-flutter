import 'package:starwiki/wiki/domain/entity/character_entity.dart';
import 'package:starwiki/core/erro/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:starwiki/wiki/domain/repository/i_star_wars_repository.dart';

class StarWarsRepository implements IStarWarsRepository {
  @override
  Future<Either<Erro, List<CharacterEntity>>> getCharacter() {
    throw UnimplementedError();
  }
}
