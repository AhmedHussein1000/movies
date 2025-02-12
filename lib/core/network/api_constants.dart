import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static  String? apiKey  = dotenv.env['API_KEY'] ??'';

  static const String nowPlayingEndPoint = '/movie/now_playing';
  static const String popularEndPoint = '/movie/popular';
  static const String topRatedEndPoint = '/movie/top_rated';
  static String movieDetailsEndPoint(int movieId) => '/movie/$movieId';
  static String recommendationEndPoint(int movieId) =>
      '/movie/$movieId/recommendations';
  static const String searchMovieEndPoint = '/search/movie';

  static const String _baseImageUrl = 'https://image.tmdb.org/t/p/w500';
  static String imageUrl(String path) => '$_baseImageUrl$path';
}
