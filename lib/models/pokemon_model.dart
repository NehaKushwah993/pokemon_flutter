import 'dart:core';

import 'package:hive/hive.dart';

part 'pokemon_model.g.dart';

@HiveType(typeId: 1)
class PokemonModel {
  @HiveField(0)
  final int? baseExperience;
  @HiveField(1)
  final int? height;
  @HiveField(2)
  final int? id;
  @HiveField(3)
  final int? weight;
  @HiveField(4)
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
