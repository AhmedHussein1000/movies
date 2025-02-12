part of 'movie_details_bloc.dart';

sealed class MovieDetailsState {
  const MovieDetailsState();
}

final class MovieDetailsInitial extends MovieDetailsState {}

// movie details states
final class MovieDetailsLoading extends MovieDetailsState {}

final class MovieDetailsSuccess extends MovieDetailsState {
  final MovieDetailsEntity movieDetails;
  const MovieDetailsSuccess({required this.movieDetails});
}

final class MovieDetailsError extends MovieDetailsState {
  final String errorMessage;
  const MovieDetailsError({required this.errorMessage});
}

// recommendations states
final class RecommendationsLoading extends MovieDetailsState {}

final class RecommendationsSuccess extends MovieDetailsState {
  final List<RecommendationEntity> recommendations;
  const RecommendationsSuccess({required this.recommendations});
}

final class RecommendationsError extends MovieDetailsState {
  final String errorMessage;
  const RecommendationsError({required this.errorMessage});
}
final class RecommendationsPaginationLoading extends MovieDetailsState {}
final class RecommendationsPaginationError extends MovieDetailsState {
  final String errorMessage;
  const RecommendationsPaginationError({required this.errorMessage});
}
final class RecommendationsNoMoreData extends MovieDetailsState {}

// class MovieDetailsState extends Equatable {
//   final MovieDetailsEntity? movieDetails;
//   final RequestState movieDetailsState;
//   final String movieDetailsErrorMessage;
//   final List<RecommendationEntity> recommendations;
//   final RequestState recommendationsState;
//   final String recommendationsErrorMessage;
//   const MovieDetailsState({
//     this.movieDetails,
//     this.movieDetailsState = RequestState.loading,
//     this.movieDetailsErrorMessage = '',
//     this.recommendations = const [],
//     this.recommendationsState = RequestState.loading,
//     this.recommendationsErrorMessage = '',
//   });
//   MovieDetailsState copyWith({
//     MovieDetailsEntity? movieDetails,
//     RequestState? movieDetailsState,
//     String? movieDetailsErrorMessage,
//     List<RecommendationEntity>? recommendations,
//     RequestState? recommendationsState,
//     String? recommendationsErrorMessage,
//   }) {
//     return MovieDetailsState(
//       movieDetails: movieDetails ?? this.movieDetails,
//       movieDetailsState: movieDetailsState ?? this.movieDetailsState,
//       movieDetailsErrorMessage:
//           movieDetailsErrorMessage ?? this.movieDetailsErrorMessage,
//       recommendations: recommendations ?? this.recommendations,
//       recommendationsState: recommendationsState ?? this.recommendationsState,
//       recommendationsErrorMessage:
//           recommendationsErrorMessage ?? this.recommendationsErrorMessage,
//     );
//   }

//   @override
//   List<Object?> get props => [
//         movieDetails,
//         movieDetailsState,
//         movieDetailsErrorMessage,
//         recommendations,
//         recommendationsState,
//         recommendationsErrorMessage
//       ];
// }
