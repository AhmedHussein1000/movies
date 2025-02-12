import 'package:hive/hive.dart';
import 'package:movies_app/movies/domain/entities/movie_entity.dart';
part 'movies_response_entity.g.dart';

@HiveType(typeId: 4)
class MoviesResponseEntity {
  @HiveField(0)
  final List<MovieEntity>? moviesList;
  @HiveField(1)
  final int? totalPages;
  @HiveField(2)
  final int? totalResults;
  @HiveField(3)
  final DateTime? timestamp;
  const MoviesResponseEntity({
    required this.moviesList,
    required this.totalPages,
    required this.totalResults,
    this.timestamp,
  });
}
