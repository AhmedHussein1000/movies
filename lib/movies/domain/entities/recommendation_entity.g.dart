// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommendation_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecommendationEntityAdapter extends TypeAdapter<RecommendationEntity> {
  @override
  final int typeId = 2;

  @override
  RecommendationEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecommendationEntity(
      id: fields[0] as int,
      backdropPath: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, RecommendationEntity obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.backdropPath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecommendationEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
