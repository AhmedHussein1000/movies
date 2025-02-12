import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'recommendation_entity.g.dart';

@HiveType(typeId: 2)
class RecommendationEntity extends Equatable {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String? backdropPath;

  const RecommendationEntity({
    required this.id,
    required this.backdropPath,
  });

  @override
  List<Object?> get props => [id, backdropPath];
}
