import 'package:flutter/material.dart';
import 'package:starwiki/config/database/database_config.dart';
import 'package:starwiki/features/characters/presentation/pages/characters_list.dart';
import 'config/injector/injector.dart' as injector;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injector.init();
  await DataBaseConfig.instance.criarBanco();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CharactersListPage(),
    );
  }
}
