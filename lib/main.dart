import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon_flutter/remote/config.dart';
import 'package:pokemon_flutter/routes/routes_instance.dart';

void main() {
  // Change as per build varient
  Config.instance.init("https://pokeapi.co/api/v2/");

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
