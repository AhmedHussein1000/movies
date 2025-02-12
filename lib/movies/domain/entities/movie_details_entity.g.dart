// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieDetailsEntityAdapter extends TypeAdapter<MovieDetailsEntity> {
  @override
  final int typeId = 1;

  @override
  MovieDetailsEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieDetailsEntity(
      id: fields[0] as int,
      title: fields[1] as String?,
      backDropPath: fields[2] as String?,
      overview: fields[3] as String?,
      releaseDate: fields[4] as String?,
      voteAverage: fields[5] as double?,
      runTime: fields[6] as int?,
      genres: (fields[7] as List?)?.cast<GenreEntity>(),
      timestamp: fields[8] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, MovieDetailsEntity obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.backDropPath)
      ..writeByte(3)
      ..write(obj.overview)
      ..writeByte(4)
      ..write(obj.releaseDate)
      ..writeByte(5)
      ..write(obj.voteAverage)
      ..writeByte(6)
      ..write(obj.runTime)
      ..writeByte(7)
      ..write(obj.genres)
      ..writeByte(8)
      ..write(obj.timestamp);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieDetailsEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
