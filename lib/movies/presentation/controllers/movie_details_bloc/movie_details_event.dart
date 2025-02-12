part of 'movie_details_bloc.dart';

sealed class MovieDetailsEvent {
  const MovieDetailsEvent();
}
final class GetMovieDetailsEvent extends MovieDetailsEvent {
  final int movieId;
  const GetMovieDetailsEvent(this.movieId);
}
final class GetRecommendationsEvent extends MovieDetailsEvent {
  final int movieId;
  const GetRecommendationsEvent(this.movieId);
}
