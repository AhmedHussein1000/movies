import 'package:get_it/get_it.dart';
import 'package:movies_app/core/cache/hive_helper.dart';
import 'package:movies_app/core/network/api_service.dart';
import 'package:movies_app/movies/data/data_source/movie_remote_data_source.dart';
import 'package:movies_app/movies/data/data_source/movies_local_data_source.dart';
import 'package:movies_app/movies/data/repository/movies_repository.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_recommendations_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_searched_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_top_rated_movies_usecase.dart';

final GetIt getIt = GetIt.instance;

abstract class ServiceLocator {
  static void setup() {
    //services
    getIt.registerLazySingleton(
      () => ApiService(),
    );

    // data sources
    getIt.registerLazySingleton<BaseMoviesRemoteDataSource>(
      () => MoviesRemoteDataSource(getIt()),
    );
    getIt.registerLazySingleton<BaseMoviesLocalDataSource>(
      () => MoviesLocalDataSource(),
    );

    // repositories
    getIt.registerLazySingleton<BaseMoviesRepository>(
        () => MoviesRepository(getIt(), getIt()));

    // usecases
    getIt.registerLazySingleton(
      () => GetNowPlayingMoviesUsecase(getIt()),
    );
    getIt.registerLazySingleton(
      () => GetPopularMoviesUsecase(getIt()),
    );

    getIt.registerLazySingleton(
      () => GetTopRatedMoviesUsecase(getIt()),
    );
    getIt.registerLazySingleton(
      () => GetMovieDetailsUsecase(getIt()),
    );
    getIt.registerLazySingleton(
      () => GetRecommendationsUsecase(getIt()),
    );
    getIt.registerLazySingleton(
      () => GetSearchedMoviesUsecase(getIt()),
    );
  }
}
