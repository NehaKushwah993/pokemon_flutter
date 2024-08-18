import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screens/pokemon_detail/pokemon_detail_screen.dart';
import 'screens/pokemon_list/pokemon_list_screen.dart';

void main() {
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
      routerConfig: GoRouter(initialLocation: "/", routes: [
        GoRoute(
            path: "/",
            builder: (ctx, state) {
              return const PokemonListScreen();
            }),
        GoRoute(
            path: "/detail",
            builder: (ctx, state) {
              return const PokemonDetailScreen();
            }),
      ]),
    );
  }
}
