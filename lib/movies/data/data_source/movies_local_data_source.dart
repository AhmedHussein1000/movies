import 'package:movies_app/core/cache/cache_constants.dart';
import 'package:movies_app/core/cache/hive_helper.dart';
import 'package:movies_app/movies/domain/entities/movie_details_entity.dart';
import 'package:movies_app/movies/domain/entities/movies_response_entity.dart';
import 'package:movies_app/movies/domain/entities/recommendations_response_entity.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_recommendations_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_top_rated_movies_usecase.dart';

abstract class BaseMoviesLocalDataSource {
  Future<MoviesResponseEntity?> getNowPlayingMovies(
      GetNowPlayingMoviesParams parameters);
  Future<MoviesResponseEntity?> getPopularMovies(GetPopularMoviesParams parameters);
  Future<MoviesResponseEntity?> getTopRatedMovies(GetTopRatedMoviesParams parameters);
  Future<MovieDetailsEntity?>getMovieDetails(GetMovieDetailsParams parameters);
  Future<RecommendationsResponseEntity?> getRecommendations(
      GetRecommendationsParams parameters);
}

class MoviesLocalDataSource extends BaseMoviesLocalDataSource {
  
  MoviesLocalDataSource();

  @override
  Future<MoviesResponseEntity?> getNowPlayingMovies(
      GetNowPlayingMoviesParams parameters) async{
    return await HiveHelper.getItemData<MoviesResponseEntity>(
        boxName: CacheConstants.nowPlayingBox,
        key: HiveHelper.getKey(page: parameters.page));
  }

  @override
  Future<MoviesResponseEntity?> getPopularMovies(GetPopularMoviesParams parameters) async{
    return await HiveHelper.getItemData<MoviesResponseEntity>(
        boxName: CacheConstants.popularBox,
        key: HiveHelper.getKey(page: parameters.page));
  }

  @override
  Future<MoviesResponseEntity?> getTopRatedMovies(GetTopRatedMoviesParams parameters) async{
    return await HiveHelper.getItemData<MoviesResponseEntity>(
        boxName: CacheConstants.topRatedBox,
        key: HiveHelper.getKey(page: parameters.page));
  }

  @override
  Future<MovieDetailsEntity?> getMovieDetails(GetMovieDetailsParams parameters) async{
    return await HiveHelper.getItemData<MovieDetailsEntity>(
        boxName: CacheConstants.movieDetailsBox, key: '${parameters.movieId}');
  }
  
  @override
 Future< RecommendationsResponseEntity?> getRecommendations(GetRecommendationsParams parameters) async{
    return await HiveHelper.getItemData<RecommendationsResponseEntity>(
        boxName: CacheConstants.recommendationBox,
        key: 'id${parameters.movieId}_page${parameters.page}');
  }
}
