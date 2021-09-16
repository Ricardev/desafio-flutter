import 'package:starwiki/core/erro/errors.dart';
import 'package:starwiki/wiki/domain/entity/character_entity.dart';
import 'package:dartz/dartz.dart';

abstract class IStarWarsRepository {
  Future<Either<Erro, List<CharacterEntity>>> getCharacter(); 
}
