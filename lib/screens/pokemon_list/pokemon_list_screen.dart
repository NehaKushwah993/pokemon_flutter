import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon_flutter/screens/pokemon_list/bloc/pokemon_list_bloc.dart';
import 'package:pokemon_flutter/screens/pokemon_list/bloc/pokemon_list_bloc_event.dart';
import 'package:pokemon_flutter/screens/pokemon_list/bloc/pokemon_list_bloc_state.dart';

class PokemonListScreen extends StatefulWidget {
  const PokemonListScreen({super.key});

  @override
  State<PokemonListScreen> createState() => _PokemonListScreenState();
}

class _PokemonListScreenState extends State<PokemonListScreen> {
  late final PokemonListBloc _bloc;

  @override
  void initState() {
    _bloc = context.read<PokemonListBloc>();
    _bloc.add(PokemonListEventInit());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pokemon list"),
      ),
      body: BlocBuilder<PokemonListBloc, PokemonListBlocState>(
        builder: (context, state) {
          return Center(
            child: GestureDetector(
              onTap: () {
                context.push("/detail");
              },
              child: const Text("click here"),
            ),
          );
        },
      ),
    );
  }
}
