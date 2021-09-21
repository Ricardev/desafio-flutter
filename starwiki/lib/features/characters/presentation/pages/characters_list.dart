import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:starwiki/core/request_service/config/injector.dart';
import 'package:starwiki/features/characters/presentation/bloc/characters_list_bloc.dart';

class CharactersListPage extends StatefulWidget {
  const CharactersListPage({Key? key}) : super(key: key);

  @override
  _CharactersListPageState createState() => _CharactersListPageState();
}

class _CharactersListPageState extends State<CharactersListPage> {
  late CharactersListBloc _bloc;

  @override
  void initState() {
    _bloc = Injector.getIt.get<CharactersListBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemCount: _bloc.characters.length,
          itemBuilder: (context, index) {
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(_bloc.characters[index].name),
                      Text(_bloc.characters[index].height),
                      Text(_bloc.characters[index].gender),
                      Text(_bloc.characters[index].mass),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
