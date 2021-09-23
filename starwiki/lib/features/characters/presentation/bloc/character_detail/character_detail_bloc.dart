import 'package:mobx/mobx.dart';
import 'package:starwiki/core/states/application_states.dart';
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

  @observable
  ObservableList<String>? specieList = ObservableList<String>();

  @observable
  ApplicationState planetState = ApplicationState.loading;

  @observable
  ApplicationState specieState = ApplicationState.loading;

  void getPlanet() async {
    if (characterEntity?.homeWorld != null) {
      final result = await planetUseCase(characterEntity!.homeWorld);
      result.fold((error) => null, (planet) => planetEntity = planet);
    } else {
      planetEntity = const PlanetEntity(planetName: 'Non-Existent');
    }

    planetState = ApplicationState.loaded;
  }

  void getSpecie() async {
    specieList?.clear();
    if (characterEntity != null && characterEntity!.specie.isNotEmpty) {
      for (String specie in characterEntity!.specie) {
        final result = await specieUseCase(SpecieParams(specieUrl: specie));
        result.fold(
          (error) => null,
          (specie) => specieList?.add(specie.specieName),
        );
      }
    } else {
      specieList?.add('Non-Existent');
    }

    specieState = ApplicationState.loaded;
  }
}
