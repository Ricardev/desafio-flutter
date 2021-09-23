import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:starwiki/core/states/application_states.dart';
import 'package:starwiki/features/characters/domain/entity/character_entity.dart';
import 'package:starwiki/features/characters/domain/usecase/get_character_search_usecase.dart';
import 'package:starwiki/features/characters/domain/usecase/get_character_usecase.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:starwiki/features/characters/domain/usecase/get_favorite_response_usecase.dart';
import 'package:starwiki/features/characters/presentation/pages/character_detail.dart';
part 'characters_list_bloc.g.dart';

class CharactersListBloc = _CharactersListBlocBase with _$CharactersListBloc;

abstract class _CharactersListBlocBase with Store {
  final GetCharacterUsecase getCharacterUsecase;
  final GetCharacterFavoriteUsecase getCharacterFavoriteUsecase;
  final GetCharacterSearchUsecase searchUsecase;

  _CharactersListBlocBase(
      {required this.getCharacterUsecase,
      required this.getCharacterFavoriteUsecase,
      required this.searchUsecase}) {
    getCharactersList();
  }

  final RefreshController _refreshController = RefreshController();

  RefreshController get refreshController => _refreshController;

  @observable
  BuildContext? _context;

  setContext(BuildContext context) => _context = context;

  @action
  Future<void> onRefresh() async {
    characters.clear();
    page = 1;
    state = ApplicationState.loading;
    await getCharactersList();
    _refreshController.loadComplete();
  }

  @action
  Future<void> onLoading() async {
    if (nextUrl != "last") {
      await getCharactersList();
      _refreshController.loadComplete();
    } else {
      _refreshController.loadNoData();
    }
  }

  void searchCharacter(String name) async {
    final result = await searchUsecase(name);
    result.fold((l) => null, (people) {
      characters.clear();
      characters.addAll(people.characters);
    });
  }

  void navigateToCharacterPage(int index) async {
    await Navigator.push(
        _context!,
        MaterialPageRoute(
            builder: (_) => CharacterDetailedPage(
                  characterEntity: characters[index],
                )));
  }

  void saveFavorite(int id) async {
    final result = await getCharacterFavoriteUsecase(FavoriteParams(id: id));
    result.fold((l) => null, (favorite) {
      if (favorite.status == "success") {
        if (favoritesList.contains(id)) {
          favoritesList.removeWhere((element) => element == id);
        } else {
          favoritesList.add(id);
        }
      }
    });
  }

  @observable
  ObservableList<int> favoritesList = ObservableList<int>();

  @observable
  ApplicationState state = ApplicationState.loading;

  @observable
  int page = 1;

  @observable
  String? nextUrl = "page2";

  @observable
  ObservableList<CharacterEntity> characters =
      ObservableList<CharacterEntity>();

  Future<void> getCharactersList() async {
    final result = await getCharacterUsecase(GetCharactersParams(page: page));
    result.fold((errors) => null, (peoples) {
      characters.addAll(peoples.characters);
      nextUrl = peoples.next;
      page++;
      state = ApplicationState.loaded;
    });
  }
}
