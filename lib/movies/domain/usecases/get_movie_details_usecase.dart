import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movies/domain/entities/movie_details_entity.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';

class GetMovieDetailsUsecase
    extends BaseUsecase<MovieDetailsEntity, GetMovieDetailsParams> {
  final BaseMoviesRepository baseMoviesRepository;
  GetMovieDetailsUsecase(this.baseMoviesRepository);
  @override
  Future<Either<Failure, MovieDetailsEntity>> call(
      GetMovieDetailsParams parameters) async {
    return await baseMoviesRepository.getMovieDetails(parameters);
  }
}

class GetMovieDetailsParams extends Equatable {
  final int movieId;
  const GetMovieDetailsParams({required this.movieId});
  @override
  List<Object?> get props => [movieId];
}
