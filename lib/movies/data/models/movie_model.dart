import 'package:movies_app/movies/domain/entities/movie_entity.dart';

class MovieModel {
  final int id;
  final String? name;
  final String? backDropPath;
  final String? overview;
  final String? releaseDate;
  final double? voteAverage;
  const MovieModel(
      {required this.id,
      required this.name,
      required this.backDropPath,
      required this.overview,
      required this.releaseDate,
      required this.voteAverage});
  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
        id: json['id'] as int,
        name: json['title'] as String?,
        backDropPath: json['backdrop_path'] as String?,
        overview: json['overview'] as String?,
        releaseDate: json['release_date'] as String?,
        voteAverage: json['vote_average'] as double?);
  }
  MovieEntity toEntity() {
    return MovieEntity(
        id: id,
        name: name,
        backDropPath: backDropPath,
        overview: overview,
        releaseDate: releaseDate,
        voteAverage: voteAverage);
  }
}
