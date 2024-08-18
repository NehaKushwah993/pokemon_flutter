import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_flutter/models/pokemon_name_url_model.dart';
import 'package:pokemon_flutter/remote/config.dart';
import 'package:pokemon_flutter/remote/pokemon_remote_data_source.dart';
import 'package:pokemon_flutter/repositories/pokemon_repository.dart';
import 'package:pokemon_flutter/repositories/pokemon_repository_impl.dart';

import 'pokemon_list_bloc_event.dart';
import 'pokemon_list_bloc_state.dart';

class PokemonListBloc extends Bloc<PokemonListBlocEvent, PokemonListBlocState> {
  PokemonRepositories repositories =
      PokemonRepositoriesImpl(PokemonRemoteDataSource(Config.instance.baseUrl));

  List<PokemonNameUrlModel> pokemonList = [];

  PokemonListBloc() : super(PokemonListStateUpdate()) {
    on<PokemonListEventInit>(fetchInitialPokemonList);
  }

  Future<void> fetchInitialPokemonList(
    PokemonListBlocEvent event,
    Emitter<PokemonListBlocState> emit,
  ) async {
    try {
      pokemonList = await repositories.fetchPokemonList(0, 0);
    } catch (e) {
      print(e);
    }
    emit(PokemonListStateUpdate());
  }
}
