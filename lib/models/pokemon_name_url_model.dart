import 'dart:core';

class PokemonNameUrlModel {
  final String name;
  final String url;

  PokemonNameUrlModel({
    required this.name,
    required this.url,
  });

  // Factory method to create a User from JSON
  factory PokemonNameUrlModel.fromJson(Map<String, dynamic> json) {
    return PokemonNameUrlModel(
      name: json['name'],
      url: json['url'],
    );
  }
}
