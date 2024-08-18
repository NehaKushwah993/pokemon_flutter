import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_flutter/models/pokemon_model.dart';
import 'package:pokemon_flutter/remote/config.dart';
import 'package:pokemon_flutter/remote/pokemon_remote_data_source.dart';
import 'package:pokemon_flutter/repositories/pokemon_repository.dart';
import 'package:pokemon_flutter/repositories/pokemon_repository_impl.dart';

import 'pokemon_detail_bloc_event.dart';
import 'pokemon_detail_bloc_state.dart';

class PokemonDetailBloc
    extends Bloc<PokemonDetailBlocEvent, PokemonDetailBlocState> {
  PokemonRepositories repositories =
      PokemonRepositoriesImpl(PokemonRemoteDataSource(Config.instance.baseUrl));

  final String id;
  PokemonModel? pokemonDetail;

  PokemonDetailBloc(this.id) : super(PokemonDetailStateUpdate()) {
    on<PokemonDetailEventInit>(fetchPokemonDetail);
  }

  Future<void> fetchPokemonDetail(
    PokemonDetailBlocEvent event,
    Emitter<PokemonDetailBlocState> emit,
  ) async {
    try {
      pokemonDetail = await repositories.fetchPokemonDetails(id);
    } catch (e) {
      print(e);
    }
    emit(PokemonDetailStateUpdate());
  }
}
