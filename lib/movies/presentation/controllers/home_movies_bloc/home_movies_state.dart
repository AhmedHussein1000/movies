part of 'home_movies_bloc.dart';

sealed class HomeMoviesState {
  const HomeMoviesState();
}

class MoviesInitial extends HomeMoviesState {}
// now playing states

class NowPlayingMoviesLoading extends HomeMoviesState {}

class NowPlayingMoviesSuccess extends HomeMoviesState {
  final List<MovieEntity> nowPlayingMovies;

  const NowPlayingMoviesSuccess({required this.nowPlayingMovies});
}

class NowPlayingMoviesError extends HomeMoviesState {
  final String errorMessage;

  const NowPlayingMoviesError({required this.errorMessage});
}

class NowPlayingMoviesPaginationLoading extends HomeMoviesState {}

class NowPlayingMoviesPaginationError extends HomeMoviesState {
  final String errorMessage;

  const NowPlayingMoviesPaginationError({required this.errorMessage});
}

class NowPlayingMoviesNoMoreData extends HomeMoviesState {}

// popular states

class PopularMoviesLoading extends HomeMoviesState {}

class PopularMoviesSuccess extends HomeMoviesState {
  final List<MovieEntity> popularMovies;

  const PopularMoviesSuccess({required this.popularMovies});
}

class PopularMoviesError extends HomeMoviesState {
  final String errorMessage;

  const PopularMoviesError({required this.errorMessage});
}

class PopularMoviesPaginationLoading extends HomeMoviesState {}

class PopularMoviesPaginationError extends HomeMoviesState {
  final String errorMessage;

  const PopularMoviesPaginationError({required this.errorMessage});
}

class PopularMoviesNoMoreData extends HomeMoviesState {}
// top rated states

class TopRatedMoviesLoading extends HomeMoviesState {}

class TopRatedMoviesSuccess extends HomeMoviesState {
  final List<MovieEntity> topRatedMovies;

  const TopRatedMoviesSuccess({required this.topRatedMovies});
}

class TopRatedMoviesError extends HomeMoviesState {
  final String errorMessage;

  const TopRatedMoviesError({required this.errorMessage});
}

class TopRatedMoviesPaginationLoading extends HomeMoviesState {}

class TopRatedMoviesPaginationError extends HomeMoviesState {
  final String errorMessage;

  const TopRatedMoviesPaginationError({required this.errorMessage});
}

class TopRatedMoviesNoMoreData extends HomeMoviesState {}
