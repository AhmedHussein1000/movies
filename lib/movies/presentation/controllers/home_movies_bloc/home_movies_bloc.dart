import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/movies/domain/entities/movie_entity.dart';
import 'package:movies_app/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_top_rated_movies_usecase.dart';

part 'home_movies_event.dart';
part 'home_movies_state.dart';

class HomeMoviesBloc extends Bloc<HomeMoviesEvent, HomeMoviesState> {
  final GetNowPlayingMoviesUsecase getNowPlayingMoviesUsecase;
  final GetPopularMoviesUsecase getPopularMoviesUsecase;
  final GetTopRatedMoviesUsecase getTopRatedMoviesUsecase;
  HomeMoviesBloc(this.getNowPlayingMoviesUsecase, this.getPopularMoviesUsecase,
      this.getTopRatedMoviesUsecase)
      : super(MoviesInitial()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);
    on<GetPopularMoviesEvent>(_getPopularMovies);
    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }
  int nowPlayingCurrentPage = 1;
  int nowPlayingTotalPages = 1;
  FutureOr<void> _getNowPlayingMovies(
      GetNowPlayingMoviesEvent event, Emitter<HomeMoviesState> emit) async {
    if (nowPlayingCurrentPage > nowPlayingTotalPages) {
      emit(NowPlayingMoviesNoMoreData());
      return;
    }
    emit(nowPlayingCurrentPage == 1
        ? NowPlayingMoviesLoading()
        : NowPlayingMoviesPaginationLoading());

    final result = await getNowPlayingMoviesUsecase(
        GetNowPlayingMoviesParams(page: nowPlayingCurrentPage));
    result.fold(
        (failure) => emit(nowPlayingCurrentPage == 1
            ? NowPlayingMoviesError(errorMessage: failure.message)
            : NowPlayingMoviesPaginationError(errorMessage: failure.message)),
        (moviesResponse) {
      nowPlayingCurrentPage += 1;
      nowPlayingTotalPages = moviesResponse.totalPages ?? 1;
      emit(NowPlayingMoviesSuccess(
          nowPlayingMovies: moviesResponse.moviesList ?? []));
    });
  }

  int popularCurrentPage = 1;
  int popularTotalPages = 1;
  FutureOr<void> _getPopularMovies(
      GetPopularMoviesEvent event, Emitter<HomeMoviesState> emit) async {
    if (popularCurrentPage > popularTotalPages) {
      emit(PopularMoviesNoMoreData());
      return;
    }
    emit(popularCurrentPage == 1
        ? PopularMoviesLoading()
        : PopularMoviesPaginationLoading());

    final result = await getPopularMoviesUsecase(
        GetPopularMoviesParams(page: popularCurrentPage));
    result.fold(
        (failure) => emit(popularCurrentPage == 1
            ? PopularMoviesError(errorMessage: failure.message)
            : PopularMoviesPaginationError(errorMessage: failure.message)),
        (moviesResponse) {
      popularCurrentPage += 1;
      popularTotalPages = moviesResponse.totalPages ?? 1;
      emit(
          PopularMoviesSuccess(popularMovies: moviesResponse.moviesList ?? []));
    });
  }

  int topRatedCurrentPage = 1;
  int topRatedTotalPages = 1;
  FutureOr<void> _getTopRatedMovies(
      GetTopRatedMoviesEvent event, Emitter<HomeMoviesState> emit) async {
    if (topRatedCurrentPage > topRatedTotalPages) {
      emit(TopRatedMoviesNoMoreData());
      return;
    }
    emit(topRatedCurrentPage == 1
        ? TopRatedMoviesLoading()
        : TopRatedMoviesPaginationLoading());

    final result = await getTopRatedMoviesUsecase(
        GetTopRatedMoviesParams(page: topRatedCurrentPage));
    result.fold(
        (failure) => emit(topRatedCurrentPage == 1
            ? TopRatedMoviesError(errorMessage: failure.message)
            : TopRatedMoviesPaginationError(errorMessage: failure.message)),
        (moviesResponse) {
      topRatedCurrentPage += 1;
      topRatedTotalPages = moviesResponse.totalPages ?? 1;
      emit(TopRatedMoviesSuccess(
          topRatedMovies: moviesResponse.moviesList ?? []));
    });
  }
}
