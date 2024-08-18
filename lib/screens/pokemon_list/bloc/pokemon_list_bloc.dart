import 'package:flutter_bloc/flutter_bloc.dart';

import 'pokemon_list_bloc_event.dart';
import 'pokemon_list_bloc_state.dart';

class PokemonListBloc extends Bloc<PokemonListBlocEvent, PokemonListBlocState> {
  PokemonListBloc() : super(PokemonListStateUpdate()) {
    on<PokemonListEventInit>(updateUI);
  }

  Future<void> updateUI(
    PokemonListBlocEvent event,
    Emitter<PokemonListBlocState> emit,
  ) async {
    emit(PokemonListStateUpdate());
  }
}
