import 'package:mobx/mobx.dart';
import 'package:starwiki/features/characters/domain/entity/character_entity.dart';
import 'package:starwiki/features/characters/domain/usecase/get_character_usecase.dart';
part 'characters_list_bloc.g.dart';

class CharactersListBloc = _CharactersListBlocBase with _$CharactersListBloc;

abstract class _CharactersListBlocBase with Store {
  final GetCharacterUsecase getCharacterUsecase;

  _CharactersListBlocBase({required this.getCharacterUsecase}) {
    getCharactersList();
  }

  @observable
  String page = "1";

  @observable
  String? nextUrl = "page2";

  @observable
  List<CharacterEntity> characters = [];

  Future<void> getCharactersList() async {
    if (nextUrl == null) {
      final result = await getCharacterUsecase(GetCharactersParams(page: page));
      result.fold((errors) => null, (peoples) {
        characters = peoples.characters;
        nextUrl = peoples.next;
      });
    }
  }
}
