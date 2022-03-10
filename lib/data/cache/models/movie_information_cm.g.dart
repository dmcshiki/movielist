// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_information_cm.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieInformationCMAdapter extends TypeAdapter<MovieInformationCM> {
  @override
  final int typeId = 1;

  @override
  MovieInformationCM read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieInformationCM(
      title: fields[0] as String,
      image: fields[1] as String,
      id: fields[2] as String,
      genres: (fields[3] as List).cast<String>(),
      score: fields[4] as String,
      releaseDate: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MovieInformationCM obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.genres)
      ..writeByte(4)
      ..write(obj.score)
      ..writeByte(5)
      ..write(obj.releaseDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieInformationCMAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
