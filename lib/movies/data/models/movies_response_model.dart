import 'package:movies_app/movies/data/models/movie_model.dart';
import 'package:movies_app/movies/domain/entities/movies_response_entity.dart';

class MoviesResponseModel {
  final List<MovieModel>? moviesList;
  final int? totalPages;
  final int? totalResults;
  const MoviesResponseModel( 
      {required this.moviesList,
      required this.totalPages,
      required this.totalResults,});

  factory MoviesResponseModel.fromJson(Map<String, dynamic> json) {
    return MoviesResponseModel(
        moviesList: (json['results'] as List)
            .map((e) => MovieModel.fromJson(e))
            .toList() as List<MovieModel>?,
        totalPages: json['total_pages'] as int?,
        totalResults: json['total_results'] as int?,);
  }
  MoviesResponseEntity toEntity() {
    return MoviesResponseEntity(
        moviesList: moviesList?.map((e) => e.toEntity()).toList() ?? [],
        totalPages: totalPages,
        totalResults: totalResults);
  }
}
