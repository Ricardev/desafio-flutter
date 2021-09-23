import 'package:starwiki/features/characters/domain/entity/people_info_entity.dart';
import 'package:starwiki/features/characters/domain/repository/i_star_wars_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:starwiki/core/erro/errors.dart';
import 'package:equatable/equatable.dart';

class GetCharacterSearchUsecase {
  final IStarWarsRepository starWarsRepository;

  GetCharacterSearchUsecase({required this.starWarsRepository});

  Future<Either<Error, PeopleInfoEntity>> call(String name) async {
    return await starWarsRepository.getCharacterSearch(name);
  }
}

class PeopleParams extends Equatable {
  final String name;
  const PeopleParams({required this.name});

  @override
  List<Object?> get props => [name];
}
