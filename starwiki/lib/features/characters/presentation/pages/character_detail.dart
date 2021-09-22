import 'package:flutter/material.dart';
import 'package:starwiki/config/injector/injector.dart';
import 'package:starwiki/features/characters/domain/entity/character_entity.dart';
import 'package:starwiki/features/characters/presentation/bloc/character_detail/character_detail_bloc.dart';

class CharacterDetailedPage extends StatefulWidget {
  const CharacterDetailedPage({Key? key, required this.characterEntity})
      : super(key: key);
  final CharacterEntity characterEntity;

  @override
  State<CharacterDetailedPage> createState() => _CharacterDetailedPageState();
}

class _CharacterDetailedPageState extends State<CharacterDetailedPage> {
  late CharacterDetailBloc characterDetailBloc;
  @override
  void initState() {
    characterDetailBloc = injector.get<CharacterDetailBloc>();
    characterDetailBloc.setCharacterEntity(widget.characterEntity);
    characterDetailBloc.getPlanet();
    characterDetailBloc.getSpecie();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
