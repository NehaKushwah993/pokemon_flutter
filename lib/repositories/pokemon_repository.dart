import 'package:pokemon_flutter/models/pokemon_model.dart';
import 'package:pokemon_flutter/models/pokemon_name_url_model.dart';

abstract class PokemonRepositories {
  Future<List<PokemonNameUrlModel>> fetchPokemonList(int offset, int limit);
  Future<PokemonModel> fetchPokemonDetails(String id);
  Future<List<PokemonNameUrlModel>> fetchPokemonByName(String name);
}
