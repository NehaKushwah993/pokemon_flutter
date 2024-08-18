import 'dart:core';

class PokemonModel {
  final int? baseExperience;
  final int? height;
  final int? id;
  final int? weight;
  final String name;

  PokemonModel({
    this.baseExperience,
    this.height,
    this.id,
    this.weight,
    required this.name,
  });

  // Factory method to create a User from JSON
  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      baseExperience: json['base_experience'],
      height: json['height'],
      id: json['id'],
      name: json['name'],
      weight: json['weight'],
    );
  }

  double heightAsDouble() {
    return height?.toDouble() ?? 0;
  }

  double weightAsDouble() {
    return weight?.toDouble() ?? 0;
  }
}
