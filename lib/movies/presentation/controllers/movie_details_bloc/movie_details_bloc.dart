import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/movies/domain/entities/movie_details_entity.dart';
import 'package:movies_app/movies/domain/entities/recommendation_entity.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_recommendations_usecase.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUsecase getMovieDetailsUsecase;
  final GetRecommendationsUsecase getRecommendationsUsecase;

  MovieDetailsBloc(this.getMovieDetailsUsecase, this.getRecommendationsUsecase)
      : super(MovieDetailsInitial()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetRecommendationsEvent>(_getRecommendations);
  }
  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    emit(MovieDetailsLoading());
    final result = await getMovieDetailsUsecase(
        GetMovieDetailsParams(movieId: event.movieId));
    result.fold(
        (failure) => emit(MovieDetailsError(errorMessage: failure.message)),
        (movieDetails) =>
            emit(MovieDetailsSuccess(movieDetails: movieDetails)));
  }

  int recommendationsCurrentPage = 1;
  int recommendationsTotalPages = 1;
  FutureOr<void> _getRecommendations(
      GetRecommendationsEvent event, Emitter<MovieDetailsState> emit) async {
    if (recommendationsCurrentPage > recommendationsTotalPages) {
      emit(RecommendationsNoMoreData());
      return;
    }
    emit(recommendationsCurrentPage == 1
        ? RecommendationsLoading()
        : RecommendationsPaginationLoading());

    final result = await getRecommendationsUsecase(
        GetRecommendationsParams(movieId: event.movieId,page: recommendationsCurrentPage));
    result.fold(
        (failure) => emit(recommendationsCurrentPage == 1
            ? RecommendationsError(errorMessage: failure.message)
            : RecommendationsPaginationError(errorMessage: failure.message)),
        (recommendationResponse) {
      recommendationsCurrentPage += 1;
      recommendationsTotalPages = recommendationResponse.totalPages ?? 1;
      emit(RecommendationsSuccess(
          recommendations: recommendationResponse.moviesList ?? []));
    });
  }
}
