// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characters_list_bloc.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CharactersListBloc on _CharactersListBlocBase, Store {
  final _$_contextAtom = Atom(name: '_CharactersListBlocBase._context');

  @override
  BuildContext? get _context {
    _$_contextAtom.reportRead();
    return super._context;
  }

  @override
  set _context(BuildContext? value) {
    _$_contextAtom.reportWrite(value, super._context, () {
      super._context = value;
    });
  }

  final _$stateAtom = Atom(name: '_CharactersListBlocBase.state');

  @override
  ApplicationState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(ApplicationState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$pageAtom = Atom(name: '_CharactersListBlocBase.page');

  @override
  int get page {
    _$pageAtom.reportRead();
    return super.page;
  }

  @override
  set page(int value) {
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
  ObservableList<CharacterEntity> get characters {
    _$charactersAtom.reportRead();
    return super.characters;
  }

  @override
  set characters(ObservableList<CharacterEntity> value) {
    _$charactersAtom.reportWrite(value, super.characters, () {
      super.characters = value;
    });
  }

  final _$onRefreshAsyncAction =
      AsyncAction('_CharactersListBlocBase.onRefresh');

  @override
  Future<void> onRefresh() {
    return _$onRefreshAsyncAction.run(() => super.onRefresh());
  }

  final _$onLoadingAsyncAction =
      AsyncAction('_CharactersListBlocBase.onLoading');

  @override
  Future<void> onLoading() {
    return _$onLoadingAsyncAction.run(() => super.onLoading());
  }

  @override
  String toString() {
    return '''
state: ${state},
page: ${page},
nextUrl: ${nextUrl},
characters: ${characters}
    ''';
  }
}
