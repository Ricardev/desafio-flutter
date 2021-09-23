import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:starwiki/features/characters/presentation/bloc/characters_list_bloc.dart';

class CharacterContainer extends StatelessWidget {
  const CharacterContainer({Key? key, required this.bloc, required this.index})
      : super(key: key);
  final CharactersListBloc bloc;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
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
          child: Stack(
            children: [
              IconButton(
                  onPressed: () {
                    bloc.saveFavorite(index);
                  },
                  icon: Icon(bloc.favoritesList.contains(index)
                      ? Icons.star
                      : Icons.star_border)),
              Align(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Name: " + bloc.characters[index].name,
                    ),
                    Text("Height:  " + bloc.characters[index].height),
                    Text("Gender:  " + bloc.characters[index].gender),
                    Text("Mass:  " + bloc.characters[index].mass),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
