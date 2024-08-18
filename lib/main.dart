import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pokemon_flutter/models/pokemon_name_url_model.dart';
import 'package:pokemon_flutter/remote/config.dart';
import 'package:pokemon_flutter/routes/routes_instance.dart';
import 'package:pokemon_flutter/utils/common.dart';

void main() async {
  // Change as per build varient
  Config.instance.init("https://pokeapi.co/api/v2/");

  WidgetsFlutterBinding.ensureInitialized();

  final appDocumentDir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDocumentDir.path);
  Hive.registerAdapter(PokemonNameUrlModelAdapter());

  // Open a Hive box
  await Hive.openBox(pokemonListBox);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Pokemon',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: routerInstance,
    );
  }
}
