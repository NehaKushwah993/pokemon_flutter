import 'dart:core';

import 'package:hive/hive.dart';
part 'pokemon_name_url_model.g.dart';

@HiveType(typeId: 0)
class PokemonNameUrlModel {
  @HiveField(0)
  final String name;
  @HiveField(1)
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
