
import 'package:movies_app/movies/domain/entities/genre_entity.dart';

class GenreModel {
   final int id;
   final String? name;
  const GenreModel({required this.id, required this.name});
 factory GenreModel.fromJson(Map<String, dynamic> json) {
   return GenreModel(id: json['id'] as int, name: json['name']as String?);
 }
 GenreEntity toEntity() {
   return GenreEntity(id: id, name: name);
 }
 
}