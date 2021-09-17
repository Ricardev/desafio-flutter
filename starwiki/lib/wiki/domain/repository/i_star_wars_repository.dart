import 'package:starwiki/core/erro/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:starwiki/wiki/domain/entity/people_info_entity.dart';

abstract class IStarWarsRepository {
  Future<Either<Error, PeopleInfoEntity>> getCharacters();
}
