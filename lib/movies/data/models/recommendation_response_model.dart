import 'package:movies_app/movies/data/models/recommendation_model.dart';
import 'package:movies_app/movies/domain/entities/recommendations_response_entity.dart';

class RecommendationsResponseModel {
  final List<RecommendationModel>? moviesList;
  final int? totalPages;
  final int? totalResults;

  const RecommendationsResponseModel(
      {required this.moviesList,
      required this.totalPages,
      required this.totalResults});

  factory RecommendationsResponseModel.fromJson(Map<String, dynamic> json) {
    return RecommendationsResponseModel(
        moviesList: json['results'] != null
            ? (json['results'] as List)
                .map((e) => RecommendationModel.fromJson(e))
                .toList()
            : null,
        totalPages: json['total_pages'],
        totalResults: json['total_results']);
  }

  RecommendationsResponseEntity toEntity() {
    return RecommendationsResponseEntity(
        moviesList: moviesList?.map((e) => e.toEntity()).toList() ?? [],
        totalPages: totalPages,
        totalResults: totalResults);
  }
}
