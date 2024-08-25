import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:pokemon_flutter/models/pokemon_model.dart';
import 'package:pokemon_flutter/remote/config.dart';
import 'package:pokemon_flutter/remote/pokemon_remote_data_source.dart';
import 'package:pokemon_flutter/repositories/pokemon_repository.dart';
import 'package:pokemon_flutter/repositories/pokemon_repository_impl.dart';
import 'package:pokemon_flutter/utils/common.dart';

import 'pokemon_detail_bloc_event.dart';
import 'pokemon_detail_bloc_state.dart';

class PokemonDetailBloc
    extends Bloc<PokemonDetailBlocEvent, PokemonDetailBlocState> {
  PokemonRepositories repositories =
      PokemonRepositoriesImpl(PokemonRemoteDataSource(Config.instance.baseUrl));

  final String id;

  PokemonDetailBloc(this.id) : super(PokemonDetailStateUpdate()) {
    on<PokemonDetailEventInit>(fetchPokemonDetail);
  }

  Future<void> fetchPokemonDetail(
    PokemonDetailBlocEvent event,
    Emitter<PokemonDetailBlocState> emit,
  ) async {
    try {
      var pokemonDetail = await repositories.fetchPokemonDetails(id);
      saveDataToHive(pokemonDetail);
    } catch (e) {
      print(e);
    }
    emit(PokemonDetailStateUpdate());
  }

  saveDataToHive(PokemonModel pokemon) async {
    var box = Hive.box(pokemonDetailBox);
    await box.put(pokemon.id.toString(), pokemon);
  }
}
