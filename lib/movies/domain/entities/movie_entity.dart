import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'movie_entity.g.dart';

@HiveType(typeId: 0)
class MovieEntity extends Equatable {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String? name;

  @HiveField(2)
  final String? backDropPath;

  @HiveField(3)
  final String? overview;

  @HiveField(4)
  final String? releaseDate;

  @HiveField(5)
  final double? voteAverage;

  const MovieEntity({
    required this.id,
    required this.name,
    required this.backDropPath,
    required this.overview,
    required this.releaseDate,
    required this.voteAverage,
  });

  @override
  List<Object?> get props =>
      [id, name, backDropPath, overview, releaseDate, voteAverage];
}
