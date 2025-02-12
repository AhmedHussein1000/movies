import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movies/domain/entities/recommendations_response_entity.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';

class GetRecommendationsUsecase extends BaseUsecase<
    RecommendationsResponseEntity, GetRecommendationsParams> {
  final BaseMoviesRepository baseMoviesRepository;
  GetRecommendationsUsecase(this.baseMoviesRepository);
  @override
  Future<Either<Failure, RecommendationsResponseEntity>> call(
      GetRecommendationsParams parameters) async {
    return await baseMoviesRepository.getRecommendations(parameters);
  }
}

class GetRecommendationsParams extends Equatable {
  final int movieId;
  final int? page;
  const GetRecommendationsParams({required this.movieId, this.page = 1});
  @override
  List<Object?> get props => [movieId];
}
