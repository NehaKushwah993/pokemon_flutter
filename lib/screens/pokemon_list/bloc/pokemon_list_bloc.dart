import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:pokemon_flutter/models/pokemon_name_url_model.dart';
import 'package:pokemon_flutter/remote/config.dart';
import 'package:pokemon_flutter/remote/pokemon_remote_data_source.dart';
import 'package:pokemon_flutter/repositories/pokemon_repository.dart';
import 'package:pokemon_flutter/repositories/pokemon_repository_impl.dart';
import 'package:pokemon_flutter/utils/common.dart';

import 'pokemon_list_bloc_event.dart';
import 'pokemon_list_bloc_state.dart';

class PokemonListBloc extends Bloc<PokemonListBlocEvent, PokemonListBlocState> {
  static const int _limit = 20; // Number of items per page

  bool hasReachedMax = false;
  int offset = 0;

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
          await repositories.fetchPokemonList(offset, _limit);
      hasReachedMax = newPokemons.length < _limit;
      offset += newPokemons.length;

      saveDataToHive(newPokemons);

      emit(
        PokemonListStateLoaded(),
      );
    } catch (e) {
      emit(PokemonListStateError("error"));
    }
  }

  Future<void> saveDataToHive(List<PokemonNameUrlModel> newPokemons) async {
    var box = Hive.box(pokemonListBox);
    for (var pokemon in newPokemons) {
      await box.add(pokemon);
    }
  }

  void reset() {
    var box = Hive.box(pokemonListBox);
    hasReachedMax = false;
    offset = 0;
    box.clear();
  }
}
