import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PokemonListScreen extends StatefulWidget {
  const PokemonListScreen({super.key});

  @override
  State<PokemonListScreen> createState() => _PokemonListScreenState();
}

class _PokemonListScreenState extends State<PokemonListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pokemon list"),),
      body: Center(
        child: GestureDetector(
          onTap: () {
            context.push("/detail");
          },
          child: const Text("click here"),
        ),
      ),
    );
  }
}
