import 'package:hive/hive.dart';

part 'genre_entity.g.dart';

@HiveType(typeId: 3)
class GenreEntity {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String? name;

  const GenreEntity({
    required this.id,
    required this.name,
  });
}
