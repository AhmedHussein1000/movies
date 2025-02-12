import 'package:movies_app/movies/domain/entities/recommendation_entity.dart';

class RecommendationModel {
  final int id;
  final String? backdropPath;
  const RecommendationModel({
    required this.backdropPath,
    required this.id,
  });

  factory RecommendationModel.fromJson(Map<String, dynamic> json) {
    return RecommendationModel(
      backdropPath: json['backdrop_path'] as String?,
      id: json['id'] as int,
    );
  }
  RecommendationEntity toEntity() {
    return RecommendationEntity(id: id, backdropPath: backdropPath);
  }
}
