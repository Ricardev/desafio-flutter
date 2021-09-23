import 'package:mobx/mobx.dart';
import 'package:starwiki/features/characters/domain/entity/character_entity.dart';
import 'package:starwiki/features/characters/domain/entity/planet_entity.dart';
import 'package:starwiki/features/characters/domain/entity/specie_entity.dart';
import 'package:starwiki/features/characters/domain/usecase/get_character_planet_usecase.dart';
import 'package:starwiki/features/characters/domain/usecase/get_character_specie_usecase.dart';
part 'character_detail_bloc.g.dart';

class CharacterDetailBloc = _CharacterDetailBlocBase with _$CharacterDetailBloc;

abstract class _CharacterDetailBlocBase with Store {
  final GetCharacterPlanetUsecase planetUseCase;
  final GetCharacterSpecieUsecase specieUseCase;
  _CharacterDetailBlocBase({
    required this.planetUseCase,
    required this.specieUseCase,
  });

  void setCharacterEntity(CharacterEntity character) =>
      characterEntity = character;

  @observable
  CharacterEntity? characterEntity;

  @observable
  PlanetEntity? planetEntity;

  @observable
  SpecieEntity? specieEntity;

  void getPlanet() async {
    final result = await planetUseCase(characterEntity!.homeWorld);
    result.fold((error) => null, (planet) => planetEntity = planet);
  }

  void getSpecie() async {
    final result = await specieUseCase(
        SpecieParams(specieUrl: characterEntity!.homeWorld));
    result.fold((error) => null, (specie) => specieEntity = specie);
  }
}
