import 'package:hive/hive.dart';
import 'package:movies_app/movies/domain/entities/recommendation_entity.dart';
part 'recommendations_response_entity.g.dart';

@HiveType(typeId: 5)
class RecommendationsResponseEntity {
  @HiveField(0)
  final List<RecommendationEntity>? moviesList;
  @HiveField(1)
  final int? totalPages;
  @HiveField(2)
  final int? totalResults;
  @HiveField(3)
  final DateTime? timestamp;
  const RecommendationsResponseEntity({
    required this.moviesList,
    required this.totalPages,
    required this.totalResults,
     this.timestamp,
  });
}
