import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:pokemon_flutter/models/pokemon_model.dart';

import '../models/pokemon_name_url_model.dart';

class PokemonRemoteDataSource {
  String baseUrl;
  PokemonRemoteDataSource(this.baseUrl);

  Future<List<PokemonNameUrlModel>> fetchPokemonList(
      {required int offset, required int limit}) async {
    Response response = await http
        .get(Uri.parse("$baseUrl/pokemon?offset=$offset&limit=$limit"));

    if (response.statusCode < 200 || response.statusCode > 299) {
      throw Exception("Failed to load pokemons");
    } else {
      final Map<String, dynamic> data = json.decode(response.body);
      List<dynamic> list = data["results"];
      return list.map((json) => PokemonNameUrlModel.fromJson(json)).toList();
    }
  }

  Future<PokemonModel> fetchPokemonDetail({required String id}) async {
    Response response = await http.get(Uri.parse("$baseUrl/pokemon/$id"));

    if (response.statusCode < 200 || response.statusCode > 299) {
      throw Exception("Failed to load pokemons");
    } else {
      return PokemonModel.fromJson(json.decode(response.body));
    }
  }
}
