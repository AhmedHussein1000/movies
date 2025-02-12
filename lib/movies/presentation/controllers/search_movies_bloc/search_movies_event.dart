part of 'search_movies_bloc.dart';

sealed class SearchMoviesEvent {
  const SearchMoviesEvent();
}

final class GetSearchedMoviesEvent extends SearchMoviesEvent {
  final String query;

  const GetSearchedMoviesEvent({required this.query});
}
