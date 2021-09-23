import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:starwiki/config/injector/injector.dart';
import 'package:starwiki/core/states/application_states.dart';
import 'package:starwiki/features/characters/presentation/bloc/characters_list_bloc.dart';
import 'package:starwiki/features/characters/presentation/widgets/character_container.dart';

class CharactersListPage extends StatefulWidget {
  const CharactersListPage({Key? key}) : super(key: key);

  @override
  _CharactersListPageState createState() => _CharactersListPageState();
}

class _CharactersListPageState extends State<CharactersListPage> {
  late CharactersListBloc _bloc;
  final TextEditingController textEditingController = TextEditingController();
  Icon _searchIcon = const Icon(Icons.search);
  Widget _appBarTitle = const Text('Wiki do StarWars');

  @override
  void initState() {
    _bloc = injector.get<CharactersListBloc>();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _bloc.setContext(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildBar(context),
      backgroundColor: Colors.black,
      body: Observer(
        builder: (_) => _bloc.state == ApplicationState.loading
            ? const Center(child: CircularProgressIndicator())
            : SmartRefresher(
                controller: _bloc.refreshController,
                onLoading: _bloc.onLoading,
                onRefresh: _bloc.onRefresh,
                enablePullUp: true,
                enablePullDown: true,
                header: const WaterDropHeader(),
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1),
                    itemCount: _bloc.characters.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => _bloc.navigateToCharacterPage(index),
                        child: CharacterContainer(
                          bloc: _bloc,
                          index: index,
                        ),
                      );
                    }),
              ),
      ),
    );
  }

  void _searchPressed() {
    setState(() {
      if (_searchIcon.icon == Icons.search) {
        _searchIcon = const Icon(Icons.close);
        _appBarTitle = TextField(
          style: const TextStyle(color: Colors.white),
          controller: textEditingController,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {
                _bloc.searchCharacter(textEditingController.text);
              },
            ),
            hintText: 'Search...',
            hintStyle: TextStyle(color: Colors.white),
          ),
        );
      } else {
        _appBarTitle = const Text('Wiki do StarWars');
        _searchIcon = const Icon(
          Icons.search,
          color: Colors.white,
        );
      }
    });
  }

  PreferredSizeWidget _buildBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black87,
      foregroundColor: Colors.white,
      centerTitle: true,
      title: _appBarTitle,
      leading: IconButton(
        icon: _searchIcon,
        onPressed: _searchPressed,
      ),
    );
  }
}
