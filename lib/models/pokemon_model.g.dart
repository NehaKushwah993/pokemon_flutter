// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PokemonModelAdapter extends TypeAdapter<PokemonModel> {
  @override
  final int typeId = 1;

  @override
  PokemonModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PokemonModel(
      baseExperience: fields[0] as int?,
      height: fields[1] as int?,
      id: fields[2] as int?,
      weight: fields[3] as int?,
      name: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PokemonModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.baseExperience)
      ..writeByte(1)
      ..write(obj.height)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.weight)
      ..writeByte(4)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PokemonModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
