import 'package:starwiki/core/erro/exceptions.dart';
import 'package:starwiki/wiki/data/datasource/star_wars_datasource.dart';
import 'package:starwiki/core/erro/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:starwiki/wiki/domain/entity/people_info_entity.dart';
import 'package:starwiki/wiki/domain/repository/i_star_wars_repository.dart';

class StarWarsRepository implements IStarWarsRepository {
  final StarWarsDatasource starWarsDatasource;

  StarWarsRepository({required this.starWarsDatasource});
  @override
  Future<Either<Error, PeopleInfoEntity>> getCharacters() async {
    try {
      final result = await starWarsDatasource.getCharactersFromData();
      return Right(result);
    } on ServerException {
      return Left(ServerError());
    }
  }
}
