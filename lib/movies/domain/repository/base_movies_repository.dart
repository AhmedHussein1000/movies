import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/domain/entities/movie_details_entity.dart';
import 'package:movies_app/movies/domain/entities/movie_entity.dart';
import 'package:movies_app/movies/domain/entities/movies_response_entity.dart';
import 'package:movies_app/movies/domain/entities/recommendations_response_entity.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_recommendations_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_searched_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_top_rated_movies_usecase.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure, MoviesResponseEntity>> getNowPlayingMovies(
      GetNowPlayingMoviesParams parameters);

  Future<Either<Failure, MoviesResponseEntity>> getPopularMovies(
      GetPopularMoviesParams parameters);

  Future<Either<Failure, MoviesResponseEntity>> getTopRatedMovies(
      GetTopRatedMoviesParams parameters);

  Future<Either<Failure, MovieDetailsEntity>> getMovieDetails(
      GetMovieDetailsParams parameters);

  Future<Either<Failure, RecommendationsResponseEntity>> getRecommendations(
      GetRecommendationsParams parameters);
  Future<Either<Failure, List<MovieEntity>>> getSearchedMovies(GetSearchedMoviesParams parameters);
}
