import 'package:starwiki/core/erro/exceptions.dart';
import 'package:starwiki/core/erro/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:starwiki/features/characters/data/datasource/i_star_wars_datasource.dart';
import 'package:starwiki/features/characters/domain/entity/people_info_entity.dart';
import 'package:starwiki/features/characters/domain/entity/planet_entity.dart';
import 'package:starwiki/features/characters/domain/entity/specie_entity.dart';
import 'package:starwiki/features/characters/domain/repository/i_star_wars_repository.dart';
import 'package:starwiki/features/characters/domain/usecase/get_character_usecase.dart';

class StarWarsRepository implements IStarWarsRepository {
  final IStarWarsDatasource starWarsDatasource;

  StarWarsRepository({required this.starWarsDatasource});
  @override
  Future<Either<Error, PeopleInfoEntity>> getCharacters(
      GetCharactersParams params) async {
    try {
      final result = await starWarsDatasource.getCharactersFromData(params);
      return Right(result);
    } on ServerException {
      return Left(ServerError());
    }
  }

  @override
  Future<Either<Error, PlanetEntity>> getCharacterPlanet(String planetUrl) async {
    try {
      final result = await starWarsDatasource.getCharacterPlanet(planetUrl);
      return Right(result);
    } on ServerException {
      return Left(ServerError());
    }
  }

  @override
  Future<Either<Error, SpecieEntity>> getCharacterSpecie(String specieUrl) async {
    try {
      final result = await starWarsDatasource.getCharacterSpecie(specieUrl);
      return Right(result);
    } on ServerException {
      return Left(ServerError());
    }
  }


  
}
