import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:starwiki/config/injector/injector.dart';
import 'package:starwiki/core/states/application_states.dart';
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Character Information'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: Colors.black,
      body: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(0.6),
                  Colors.white.withOpacity(0.3),
                ],
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(
                width: 1.5,
                color: Colors.white.withOpacity(0.2),
              ),
            ),
            child: Center(
              child: Observer(
                builder: (_) => characterDetailBloc.specieState ==
                            ApplicationState.loaded &&
                        characterDetailBloc.planetState ==
                            ApplicationState.loaded
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Name: " + widget.characterEntity.name,
                          ),
                          Text("Height:  " + widget.characterEntity.height),
                          Text("Gender:  " + widget.characterEntity.gender),
                          Text("Mass:  " + widget.characterEntity.mass),
                          Text(
                            "Hair Color: " + widget.characterEntity.hairColor,
                          ),
                          Text("Skin Color:  " +
                              widget.characterEntity.skinColor),
                          Text(
                              "Eye Color:  " + widget.characterEntity.eyeColor),
                          Text("Birth Year:  " +
                              widget.characterEntity.birthYear),
                          Text("Specie:  " +
                              characterDetailBloc.specieList.toString()),
                          Text("Birth Year:  " +
                              characterDetailBloc.planetEntity!.planetName),
                        ],
                      )
                    : const Center(child: CircularProgressIndicator()),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
