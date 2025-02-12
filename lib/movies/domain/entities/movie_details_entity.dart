import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:movies_app/movies/domain/entities/genre_entity.dart';

part 'movie_details_entity.g.dart';

@HiveType(typeId: 1)
class MovieDetailsEntity extends Equatable {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String? title;

  @HiveField(2)
  final String? backDropPath;
  @HiveField(3)
  final String? overview;

  @HiveField(4)
  final String? releaseDate;

  @HiveField(5)
  final double? voteAverage;

  @HiveField(6)
  final int? runTime;
  @HiveField(7)
  final List<GenreEntity>? genres;
  @HiveField(8)
  final DateTime? timestamp;

  const MovieDetailsEntity( {
    required this.id,
    required this.title,
    required this.backDropPath,
    required this.overview,
    required this.releaseDate,
    required this.voteAverage,
    required this.runTime,
    required this.genres,
    this.timestamp,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        backDropPath,
        overview,
        releaseDate,
        voteAverage,
        runTime,
        genres
      ];
}
