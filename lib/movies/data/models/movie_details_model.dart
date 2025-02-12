import 'package:movies_app/movies/data/models/genre_model.dart';
import 'package:movies_app/movies/domain/entities/movie_details_entity.dart';

class MovieDetailsModel {
  final int id;
  final String? backDropPath;
  final String? title;
  final double? voteAverage;
  final String? overview;
  final String? releaseDate;
  final List<GenreModel>? genres;
  final int? runTime;

  const MovieDetailsModel(
      {required this.id,
      required this.backDropPath,
      required this.title,
      required this.voteAverage,
      required this.overview,
      required this.releaseDate,
      required this.genres,
      required this.runTime});
  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
        id: json['id'] as int,
        backDropPath: json['backdrop_path'] as String?,
        title: json['title'] as String?,
        voteAverage: json['vote_average'].toDouble() as double?,
        overview: json['overview'] as String?,
        releaseDate: json['release_date'] as String?,
        genres: json['genres'] != null ? List<GenreModel>.from(
            json['genres'].map((jsonGenre) => GenreModel.fromJson(jsonGenre))) : null,
        runTime: json['runtime'] as int?);
  }
  MovieDetailsEntity toEntity() {
    return MovieDetailsEntity(
        id: id,
        backDropPath: backDropPath,
        title: title,
        voteAverage: voteAverage,
        overview: overview,
        releaseDate: releaseDate,
        genres:  genres?.map((genre) => genre.toEntity()).toList(),
        runTime: runTime);
  }
}
