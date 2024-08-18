import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon_flutter/routes/routes_instance.dart';
import 'package:pokemon_flutter/screens/pokemon_list/pokemon_list.dart';
import 'package:pokemon_flutter/screens/widgets/pokemon_list_item_widget.dart';
import 'package:pokemon_flutter/utils/url_utils.dart';

class PokemonListScreen extends StatefulWidget {
  const PokemonListScreen({super.key});

  @override
  State<PokemonListScreen> createState() => _PokemonListScreenState();
}

class _PokemonListScreenState extends State<PokemonListScreen> {
  late final PokemonListBloc _bloc;
  final ScrollController _scrollController = ScrollController();
  bool _isFetchingMore = false;

  @override
  void initState() {
    super.initState();

    _bloc = context.read<PokemonListBloc>();

    // Fetch initial data
    _bloc.add(PokemonListEventFetch());

    // Attach the scroll listener
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      final currentState = _bloc.state;

      if (currentState is PokemonListStateLoaded && !_isFetchingMore) {
        _isFetchingMore = true;
        context.read<PokemonListBloc>().add(PokemonListEventFetch());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pokemon list"),
      ),
      body: BlocConsumer<PokemonListBloc, PokemonListBlocState>(
        listener: (context, state) {
          if (state is PokemonListStateLoaded) {
            _isFetchingMore = false;
          }
        },
        builder: (context, state) {
          final pokemonList = _bloc.pokemonList;

          if (pokemonList.isEmpty && state is PokemonListStateLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return GridView.builder(
            controller: _scrollController,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of items per row
              crossAxisSpacing: 8.0, // Space between columns
              mainAxisSpacing: 8.0, // Space between rows
              childAspectRatio: 1, // Aspect ratio of each item
            ),
            padding: const EdgeInsets.all(8.0),
            itemCount: pokemonList.length + (_isFetchingMore ? 1 : 0),
            itemBuilder: (context, index) {
              if (index >= pokemonList.length) {
                return const Center(child: CircularProgressIndicator());
              }

              final item = pokemonList[index];
              return GridTile(
                child: PokemonListItemWidget(
                  item,
                  onTap: () {
                    final String route = detailRoute.path.replaceFirst(
                        ':id', extractPokemonId(pokemonList[index].url));
                    context.push(route);
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
