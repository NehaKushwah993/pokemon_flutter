import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon_flutter/screens/pokemon_list/pokemon_list.dart';
import 'package:pokemon_flutter/screens/widgets/pokemon_list_item_widget.dart';

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
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of items per row
              crossAxisSpacing: 8.0, // Space between columns
              mainAxisSpacing: 8.0, // Space between rows
              childAspectRatio: 1, // Aspect ratio of each item
            ),
            padding: const EdgeInsets.all(8.0),
            itemCount: _bloc.pokemonList.length,
            itemBuilder: (context, index) {
              final item = _bloc.pokemonList[index];
              return GridTile(
                child: PokemonListItemWidget(
                  item,
                  onTap: () {
                    context.go("/detail");
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
