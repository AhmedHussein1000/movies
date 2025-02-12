import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movies/domain/entities/movies_response_entity.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';

class GetPopularMoviesUsecase
    extends BaseUsecase<MoviesResponseEntity, GetPopularMoviesParams> {
  final BaseMoviesRepository baseMoviesRepository;
  GetPopularMoviesUsecase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, MoviesResponseEntity>> call(
      GetPopularMoviesParams parameters) async {
    return await baseMoviesRepository.getPopularMovies(parameters);
  }
}class GetPopularMoviesParams {
  final int? page;

  GetPopularMoviesParams({this.page=1});
}
