// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_detail_bloc.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CharacterDetailBloc on _CharacterDetailBlocBase, Store {
  final _$characterEntityAtom =
      Atom(name: '_CharacterDetailBlocBase.characterEntity');

  @override
  CharacterEntity? get characterEntity {
    _$characterEntityAtom.reportRead();
    return super.characterEntity;
  }

  @override
  set characterEntity(CharacterEntity? value) {
    _$characterEntityAtom.reportWrite(value, super.characterEntity, () {
      super.characterEntity = value;
    });
  }

  final _$planetEntityAtom =
      Atom(name: '_CharacterDetailBlocBase.planetEntity');

  @override
  PlanetEntity? get planetEntity {
    _$planetEntityAtom.reportRead();
    return super.planetEntity;
  }

  @override
  set planetEntity(PlanetEntity? value) {
    _$planetEntityAtom.reportWrite(value, super.planetEntity, () {
      super.planetEntity = value;
    });
  }

  final _$specieEntityAtom =
      Atom(name: '_CharacterDetailBlocBase.specieEntity');

  @override
  SpecieEntity? get specieEntity {
    _$specieEntityAtom.reportRead();
    return super.specieEntity;
  }

  @override
  set specieEntity(SpecieEntity? value) {
    _$specieEntityAtom.reportWrite(value, super.specieEntity, () {
      super.specieEntity = value;
    });
  }

  final _$specieListAtom = Atom(name: '_CharacterDetailBlocBase.specieList');

  @override
  ObservableList<String>? get specieList {
    _$specieListAtom.reportRead();
    return super.specieList;
  }

  @override
  set specieList(ObservableList<String>? value) {
    _$specieListAtom.reportWrite(value, super.specieList, () {
      super.specieList = value;
    });
  }

  final _$planetStateAtom = Atom(name: '_CharacterDetailBlocBase.planetState');

  @override
  ApplicationState get planetState {
    _$planetStateAtom.reportRead();
    return super.planetState;
  }

  @override
  set planetState(ApplicationState value) {
    _$planetStateAtom.reportWrite(value, super.planetState, () {
      super.planetState = value;
    });
  }

  final _$specieStateAtom = Atom(name: '_CharacterDetailBlocBase.specieState');

  @override
  ApplicationState get specieState {
    _$specieStateAtom.reportRead();
    return super.specieState;
  }

  @override
  set specieState(ApplicationState value) {
    _$specieStateAtom.reportWrite(value, super.specieState, () {
      super.specieState = value;
    });
  }

  @override
  String toString() {
    return '''
characterEntity: ${characterEntity},
planetEntity: ${planetEntity},
specieEntity: ${specieEntity},
specieList: ${specieList},
planetState: ${planetState},
specieState: ${specieState}
    ''';
  }
}
