import 'package:starwiki/core/erro/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:starwiki/core/usecases/usecases.dart';
import 'package:equatable/equatable.dart';
import 'package:starwiki/features/characters/domain/entity/people_info_entity.dart';
import 'package:starwiki/features/characters/domain/repository/i_star_wars_repository.dart';

class GetCharacterUsecase
    implements UseCase<PeopleInfoEntity, GetCharactersParams> {
  final IStarWarsRepository starWarsRepository;

  GetCharacterUsecase({required this.starWarsRepository});
  @override
  Future<Either<Error, PeopleInfoEntity>> call(
      GetCharactersParams params) async {
    return await starWarsRepository.getCharacters(params);
  }
}

class GetCharactersParams extends Equatable {
  final String page;
  GetCharactersParams({required this.page});

  @override
  List<Object?> get props => [page];
}
