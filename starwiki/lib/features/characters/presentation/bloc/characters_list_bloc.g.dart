// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characters_list_bloc.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CharactersListBloc on _CharactersListBlocBase, Store {
  final _$pageAtom = Atom(name: '_CharactersListBlocBase.page');

  @override
  String get page {
    _$pageAtom.reportRead();
    return super.page;
  }

  @override
  set page(String value) {
    _$pageAtom.reportWrite(value, super.page, () {
      super.page = value;
    });
  }

  final _$nextUrlAtom = Atom(name: '_CharactersListBlocBase.nextUrl');

  @override
  String? get nextUrl {
    _$nextUrlAtom.reportRead();
    return super.nextUrl;
  }

  @override
  set nextUrl(String? value) {
    _$nextUrlAtom.reportWrite(value, super.nextUrl, () {
      super.nextUrl = value;
    });
  }

  final _$charactersAtom = Atom(name: '_CharactersListBlocBase.characters');

  @override
  List<CharacterEntity> get characters {
    _$charactersAtom.reportRead();
    return super.characters;
  }

  @override
  set characters(List<CharacterEntity> value) {
    _$charactersAtom.reportWrite(value, super.characters, () {
      super.characters = value;
    });
  }

  @override
  String toString() {
    return '''
page: ${page},
nextUrl: ${nextUrl},
characters: ${characters}
    ''';
  }
}
