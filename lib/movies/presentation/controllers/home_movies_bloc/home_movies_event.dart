part of 'home_movies_bloc.dart';

sealed class HomeMoviesEvent {
  const HomeMoviesEvent();
}

final class GetNowPlayingMoviesEvent extends HomeMoviesEvent {}

final class GetPopularMoviesEvent extends HomeMoviesEvent {}

final class GetTopRatedMoviesEvent extends HomeMoviesEvent {}
