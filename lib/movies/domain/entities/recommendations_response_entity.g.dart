// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommendations_response_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecommendationsResponseEntityAdapter
    extends TypeAdapter<RecommendationsResponseEntity> {
  @override
  final int typeId = 5;

  @override
  RecommendationsResponseEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecommendationsResponseEntity(
      moviesList: (fields[0] as List?)?.cast<RecommendationEntity>(),
      totalPages: fields[1] as int?,
      totalResults: fields[2] as int?,
      timestamp: fields[3] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, RecommendationsResponseEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.moviesList)
      ..writeByte(1)
      ..write(obj.totalPages)
      ..writeByte(2)
      ..write(obj.totalResults)
      ..writeByte(3)
      ..write(obj.timestamp);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecommendationsResponseEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
