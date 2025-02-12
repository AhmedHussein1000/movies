part of 'search_movies_bloc.dart';

sealed class SearchMoviesState {
  const SearchMoviesState();
}

final class SearchMoviesInitial extends SearchMoviesState {}

final class SearchMoviesLoading extends SearchMoviesState {}

final class SearchMoviesSuccess extends SearchMoviesState {
  final List<MovieEntity> movies;

  const SearchMoviesSuccess({required this.movies});
}

final class SearchMoviesError extends SearchMoviesState {
  final String message;

 const SearchMoviesError({required this.message});
}
