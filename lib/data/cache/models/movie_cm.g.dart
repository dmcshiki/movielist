// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_cm.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieCMAdapter extends TypeAdapter<MovieCM> {
  @override
  final int typeId = 0;

  @override
  MovieCM read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieCM(
      title: fields[0] as String,
      image: fields[1] as String,
      id: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MovieCM obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieCMAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
