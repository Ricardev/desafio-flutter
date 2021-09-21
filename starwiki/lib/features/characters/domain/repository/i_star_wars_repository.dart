import 'package:starwiki/core/erro/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:starwiki/features/characters/domain/entity/people_info_entity.dart';
import 'package:starwiki/features/characters/domain/usecase/get_character_usecase.dart';

abstract class IStarWarsRepository {
  Future<Either<Error, PeopleInfoEntity>> getCharacters(
      GetCharactersParams params);
}