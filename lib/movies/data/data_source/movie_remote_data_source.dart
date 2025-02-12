import 'package:dio/dio.dart';
import 'package:movies_app/core/cache/cache_constants.dart';
import 'package:movies_app/core/cache/hive_helper.dart';
import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/helpers/extensions.dart';
import 'package:movies_app/core/network/api_constants.dart';
import 'package:movies_app/core/network/api_service.dart';
import 'package:movies_app/core/network/error_model.dart';
import 'package:movies_app/movies/data/models/movie_details_model.dart';
import 'package:movies_app/movies/data/models/movie_model.dart';
import 'package:movies_app/movies/data/models/movies_response_model.dart';
import 'package:movies_app/movies/data/models/recommendation_response_model.dart';
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

abstract class BaseMoviesRemoteDataSource {
  Future<MoviesResponseEntity> getNowPlayingMovies(
      GetNowPlayingMoviesParams parameters);
  Future<MoviesResponseEntity> getPopularMovies(
      GetPopularMoviesParams parameters);
  Future<MoviesResponseEntity> getTopRatedMovies(
      GetTopRatedMoviesParams parameters);
  Future<MovieDetailsEntity> getMovieDetails(GetMovieDetailsParams parameters);
  Future<RecommendationsResponseEntity> getRecommendations(
      GetRecommendationsParams parameters);
  Future<List<MovieEntity>> getSearchedMovies(
      GetSearchedMoviesParams parameters);
}

class MoviesRemoteDataSource extends BaseMoviesRemoteDataSource {
  final HiveHelper hiveHelper;
  final ApiService apiService;
  MoviesRemoteDataSource(this.hiveHelper, this.apiService);
  @override
  Future<MoviesResponseEntity> getNowPlayingMovies(
      GetNowPlayingMoviesParams parameters) async {
    final Response response = await apiService.getData(
        endpoint: ApiConstants.nowPlayingEndPoint,
        queryParameters: {
          'api_key': ApiConstants.apiKey,
          'page': parameters.page
        });
    if (response.statusCode == 200) {
      final moviesResponse =
          MoviesResponseModel.fromJson(response.data).toEntity();
      if (!moviesResponse.moviesList.isNullOrEmpty()) {
        await hiveHelper.saveItemData<MoviesResponseEntity>(
            data: MoviesResponseEntity(
                moviesList: moviesResponse.moviesList,
                totalPages: moviesResponse.totalPages,
                totalResults: moviesResponse.totalResults,
                timestamp: DateTime.now()),
            boxName: CacheConstants.nowPlayingBox,
            key: hiveHelper.getKey(page: parameters.page));
      }
      return moviesResponse;
    } else {
      throw ServerException(errorModel: ErrorModel.fromJson(response.data));
    }
  }

  @override
  Future<MoviesResponseEntity> getPopularMovies(
      GetPopularMoviesParams parameters) async {
    final Response response = await apiService.getData(
        endpoint: ApiConstants.popularEndPoint,
        queryParameters: {
          'api_key': ApiConstants.apiKey,
          'page': parameters.page
        });
    if (response.statusCode == 200) {
      final moviesResponse =
          MoviesResponseModel.fromJson(response.data).toEntity();
      if (!moviesResponse.moviesList.isNullOrEmpty()) {
        await hiveHelper.saveItemData<MoviesResponseEntity>(
            data: MoviesResponseEntity(
                moviesList: moviesResponse.moviesList,
                totalPages: moviesResponse.totalPages,
                totalResults: moviesResponse.totalResults,
                timestamp: DateTime.now()),
            boxName: CacheConstants.popularBox,
            key: hiveHelper.getKey(page: parameters.page));
      }
      return moviesResponse;
    } else {
      throw ServerException(errorModel: ErrorModel.fromJson(response.data));
    }
  }

  @override
  Future<MoviesResponseEntity> getTopRatedMovies(
      GetTopRatedMoviesParams parameters) async {
    final Response response = await apiService.getData(
        endpoint: ApiConstants.topRatedEndPoint,
        queryParameters: {
          'api_key': ApiConstants.apiKey,
          'page': parameters.page
        });
    if (response.statusCode == 200) {
      final moviesResponse =
          MoviesResponseModel.fromJson(response.data).toEntity();
      if (!moviesResponse.moviesList.isNullOrEmpty()) {
        await hiveHelper.saveItemData<MoviesResponseEntity>(
            data: MoviesResponseEntity(
                moviesList: moviesResponse.moviesList,
                totalPages: moviesResponse.totalPages,
                totalResults: moviesResponse.totalResults,
                timestamp: DateTime.now()),
            boxName: CacheConstants.topRatedBox,
            key: hiveHelper.getKey(page: parameters.page));
      }
      return moviesResponse;
    } else {
      throw ServerException(errorModel: ErrorModel.fromJson(response.data));
    }
  }

  @override
  Future<RecommendationsResponseEntity> getRecommendations(
      GetRecommendationsParams parameters) async {
    final Response response = await apiService.getData(
        endpoint: ApiConstants.recommendationEndPoint(parameters.movieId),
        queryParameters: {
          'api_key': ApiConstants.apiKey,
          'page': parameters.page
        });
    if (response.statusCode == 200) {
      final recommendationsResponse =
          RecommendationsResponseModel.fromJson(response.data).toEntity();
      if (!recommendationsResponse.moviesList.isNullOrEmpty()) {
        await hiveHelper.saveItemData<RecommendationsResponseEntity>(
          data: RecommendationsResponseEntity(
              moviesList: recommendationsResponse.moviesList,
              totalPages: recommendationsResponse.totalPages,
              totalResults: recommendationsResponse.totalResults,
              timestamp: DateTime.now()),
          boxName: CacheConstants.recommendationBox,
          key: 'id${parameters.movieId}_page${parameters.page}',
        );
      }

      return recommendationsResponse;
    } else {
      throw ServerException(errorModel: ErrorModel.fromJson(response.data));
    }
  }

  @override
  Future<MovieDetailsEntity> getMovieDetails(
      GetMovieDetailsParams parameters) async {
    final Response response = await apiService.getData(
        endpoint: ApiConstants.movieDetailsEndPoint(parameters.movieId),
        queryParameters: {'api_key': ApiConstants.apiKey});
    if (response.statusCode == 200) {
      MovieDetailsEntity movieDetails =
          MovieDetailsModel.fromJson(response.data).toEntity();
      await hiveHelper.saveItemData<MovieDetailsEntity>(
          data: MovieDetailsEntity(
              id: movieDetails.id,
              title: movieDetails.title,
              backDropPath: movieDetails.backDropPath,
              overview: movieDetails.overview,
              releaseDate: movieDetails.releaseDate,
              voteAverage: movieDetails.voteAverage,
              runTime: movieDetails.runTime,
              genres: movieDetails.genres,
              timestamp: DateTime.now()),
          boxName: CacheConstants.movieDetailsBox,
          key: '${movieDetails.id}');
      return movieDetails;
    } else {
      throw ServerException(errorModel: ErrorModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieEntity>> getSearchedMovies(
      GetSearchedMoviesParams parameters) async {
    if (parameters.query.isNullOrEmpty()) {
      return const [];
    }
    final Response response = await apiService.getData(
        endpoint: ApiConstants.searchMovieEndPoint,
        queryParameters: {
          'api_key': ApiConstants.apiKey,
          'query': parameters.query
        });
    if (response.statusCode == 200) {
      List<dynamic> jsonMovies = response.data['results'];
      List<MovieEntity> searchedMovies = jsonMovies
          .map(
            (e) => MovieModel.fromJson(e).toEntity(),
          )
          .toList();
      return searchedMovies;
    }
    throw ServerException(errorModel: ErrorModel.fromJson(response.data));
  }
}
