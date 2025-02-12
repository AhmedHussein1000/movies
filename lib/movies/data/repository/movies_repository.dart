import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/helpers/extensions.dart';
import 'package:movies_app/core/utils/app_constants.dart';
import 'package:movies_app/movies/data/data_source/movie_remote_data_source.dart';
import 'package:movies_app/movies/data/data_source/movies_local_data_source.dart';
import 'package:movies_app/movies/domain/entities/movie_details_entity.dart';
import 'package:movies_app/movies/domain/entities/movie_entity.dart';
import 'package:movies_app/movies/domain/entities/movies_response_entity.dart';
import 'package:movies_app/movies/domain/entities/recommendations_response_entity.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_recommendations_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_searched_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_top_rated_movies_usecase.dart';

class MoviesRepository extends BaseMoviesRepository {
  final BaseMoviesRemoteDataSource baseMoviesRemoteDataSource;
  final BaseMoviesLocalDataSource baseMoviesLocalDataSource;
  MoviesRepository(
      this.baseMoviesRemoteDataSource, this.baseMoviesLocalDataSource);

  @override
  Future<Either<Failure, MoviesResponseEntity>> getNowPlayingMovies(
      GetNowPlayingMoviesParams parameters) async {
    try {
      final cachedMoviesResponse =
         await baseMoviesLocalDataSource.getNowPlayingMovies(parameters);

      if (cachedMoviesResponse != null &&
          !cachedMoviesResponse.moviesList.isNullOrEmpty()) {
        return Right(cachedMoviesResponse);
      }
      final remoteMoviesResponse =
          await baseMoviesRemoteDataSource.getNowPlayingMovies(parameters);
      return Right(remoteMoviesResponse);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorModel.statusMessage));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      log('error in now playing movies ${e.toString()}');
      return const Left(ServerFailure(AppConstants.unexpectedError));
    }
  }

  @override
  Future<Either<Failure, MoviesResponseEntity>> getPopularMovies(
      GetPopularMoviesParams parameters) async {
    try {
      final cachedMoviesResponse =
         await baseMoviesLocalDataSource.getPopularMovies(parameters);

      if (cachedMoviesResponse != null &&
          !cachedMoviesResponse.moviesList.isNullOrEmpty()) {
        return Right(cachedMoviesResponse);
      }
      final remoteMoviesResponse =
          await baseMoviesRemoteDataSource.getPopularMovies(parameters);
      return Right(remoteMoviesResponse);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorModel.statusMessage));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      log('error in popular movies ${e.toString()}');
      return const Left(ServerFailure(AppConstants.unexpectedError));
    }
  }

  @override
  Future<Either<Failure, MoviesResponseEntity>> getTopRatedMovies(
      GetTopRatedMoviesParams parameters) async {
    try {
      final cachedMoviesResponse =
        await  baseMoviesLocalDataSource.getTopRatedMovies(parameters);

      if (cachedMoviesResponse != null &&
          !cachedMoviesResponse.moviesList.isNullOrEmpty()) {
        return Right(cachedMoviesResponse);
      }
      final remoteMoviesResponse =
          await baseMoviesRemoteDataSource.getTopRatedMovies(parameters);
      return Right(remoteMoviesResponse);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorModel.statusMessage));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      log('error in top rated movies ${e.toString()}');
      return const Left(ServerFailure(AppConstants.unexpectedError));
    }
  }

  @override
  Future<Either<Failure, MovieDetailsEntity>> getMovieDetails(
      GetMovieDetailsParams parameters) async {
    try {
      final cachedMovieDetails =
        await  baseMoviesLocalDataSource.getMovieDetails(parameters);

      if (cachedMovieDetails != null &&
          cachedMovieDetails.id == parameters.movieId) {
        return Right(cachedMovieDetails);
      }
      final MovieDetailsEntity movieDetails =
          await baseMoviesRemoteDataSource.getMovieDetails(parameters);
      return Right(movieDetails);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorModel.statusMessage));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      log('error in movie details ${e.toString()}');
      return const Left(ServerFailure(AppConstants.unexpectedError));
    }
  }

  @override
  Future<Either<Failure, RecommendationsResponseEntity>> getRecommendations(
      GetRecommendationsParams parameters) async {
    try {
      final cachedRecommendationsResponse =
         await baseMoviesLocalDataSource.getRecommendations(parameters);

      if (cachedRecommendationsResponse != null &&
          !cachedRecommendationsResponse.moviesList.isNullOrEmpty()) {
        return Right(cachedRecommendationsResponse);
      }
      final remoteRecommendationsResponse =
          await baseMoviesRemoteDataSource.getRecommendations(parameters);
      return Right(remoteRecommendationsResponse);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorModel.statusMessage));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      log('error in recommendation movies ${e.toString()}');
      return const Left(ServerFailure(AppConstants.unexpectedError));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getSearchedMovies(
      GetSearchedMoviesParams parameters) async {
    try {
      final List<MovieEntity> searchedMovies =
          await baseMoviesRemoteDataSource.getSearchedMovies(parameters);
      return Right(searchedMovies);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorModel.statusMessage));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      log('error in searched movies ${e.toString()}');
      return const Left(ServerFailure(AppConstants.unexpectedError));
    }
  }
}
