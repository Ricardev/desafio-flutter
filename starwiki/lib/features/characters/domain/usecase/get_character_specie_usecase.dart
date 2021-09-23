import 'package:starwiki/core/usecases/usecases.dart';
import 'package:starwiki/features/characters/domain/entity/specie_entity.dart';
import 'package:starwiki/features/characters/domain/repository/i_star_wars_repository.dart';
import 'package:starwiki/core/erro/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetCharacterSpecieUsecase implements UseCase<SpecieEntity, SpecieParams> {
  final IStarWarsRepository starWarsRepository;

  GetCharacterSpecieUsecase({required this.starWarsRepository});

  @override
  Future<Either<Error, SpecieEntity>> call(SpecieParams params) async {
    return await starWarsRepository.getCharacterSpecie(params.specieUrl);
  }
}

class SpecieParams extends Equatable {
  final String specieUrl;
  const SpecieParams({required this.specieUrl});

  @override
  List<Object?> get props => [specieUrl];
}
