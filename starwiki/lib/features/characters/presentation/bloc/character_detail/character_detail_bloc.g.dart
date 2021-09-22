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

  @override
  String toString() {
    return '''
characterEntity: ${characterEntity},
planetEntity: ${planetEntity}
    ''';
  }
}
