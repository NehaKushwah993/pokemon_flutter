abstract class PokemonListBlocState {}

class PokemonListStateInit extends PokemonListBlocState {}

class PokemonListStateLoading extends PokemonListBlocState {}

class PokemonListStateLoaded extends PokemonListBlocState {}

class PokemonListStateError extends PokemonListBlocState {
  final String message;

  PokemonListStateError(this.message);
}
