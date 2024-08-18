import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_flutter/models/pokemon_name_url_model.dart';
import 'package:pokemon_flutter/remote/config.dart';
import 'package:pokemon_flutter/remote/pokemon_remote_data_source.dart';
import 'package:pokemon_flutter/repositories/pokemon_repository.dart';
import 'package:pokemon_flutter/repositories/pokemon_repository_impl.dart';

import 'pokemon_list_bloc_event.dart';
import 'pokemon_list_bloc_state.dart';

class PokemonListBloc extends Bloc<PokemonListBlocEvent, PokemonListBlocState> {
  static const int _limit = 20; // Number of items per page

  List<PokemonNameUrlModel> pokemonList = [];
  bool hasReachedMax = false;

  PokemonRepositories repositories =
      PokemonRepositoriesImpl(PokemonRemoteDataSource(Config.instance.baseUrl));

  PokemonListBloc() : super(PokemonListStateInit()) {
    on<PokemonListEventFetch>(fetchPokemonList);
  }

  Future<void> fetchPokemonList(
    PokemonListEventFetch event,
    Emitter<PokemonListBlocState> emit,
  ) async {
    emit(PokemonListStateLoading());
    try {
      final List<PokemonNameUrlModel> newPokemons =
          await repositories.fetchPokemonList(pokemonList.length, _limit);
      hasReachedMax = newPokemons.length < _limit;

      pokemonList.addAll(newPokemons);

      emit(
        PokemonListStateLoaded(),
      );
    } catch (e) {
      emit(PokemonListStateError("error"));
    }
  }
}
