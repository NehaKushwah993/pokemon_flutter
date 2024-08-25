import 'package:pokemon_flutter/models/pokemon_model.dart';
import 'package:pokemon_flutter/models/pokemon_name_url_model.dart';
import 'package:pokemon_flutter/remote/pokemon_remote_data_source.dart';
import 'package:pokemon_flutter/repositories/pokemon_repository.dart';

class PokemonRepositoriesImpl extends PokemonRepositories {
  PokemonRemoteDataSource remote;
  PokemonRepositoriesImpl(this.remote);

  @override
  Future<List<PokemonNameUrlModel>> fetchPokemonByName(String name) {
    // TODO: implement fetchPokemonByName
    return Future.delayed(Duration.zero);
  }

  @override
  Future<PokemonModel> fetchPokemonDetails(String id) {
    return remote.fetchPokemonDetail(id: id);
  }

  @override
  Future<List<PokemonNameUrlModel>> fetchPokemonList(int offset, int limit) {
    return remote.fetchPokemonList(offset: offset, limit: limit);
  }
}
