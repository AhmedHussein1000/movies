import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movies/domain/entities/movies_response_entity.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';

class GetTopRatedMoviesUsecase
    extends BaseUsecase<MoviesResponseEntity, GetTopRatedMoviesParams> {
  final BaseMoviesRepository baseMoviesRepository;

  GetTopRatedMoviesUsecase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, MoviesResponseEntity>> call(
      GetTopRatedMoviesParams parameters) async {
    return await baseMoviesRepository.getTopRatedMovies(parameters);
  }
}

class GetTopRatedMoviesParams{
  final int? page;

  const GetTopRatedMoviesParams({ this.page = 1});
}
