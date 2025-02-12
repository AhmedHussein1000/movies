import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movies/domain/entities/movies_response_entity.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';

class GetNowPlayingMoviesUsecase
    extends BaseUsecase<MoviesResponseEntity, GetNowPlayingMoviesParams> {
  final BaseMoviesRepository baseMoviesRepository;
  GetNowPlayingMoviesUsecase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, MoviesResponseEntity>> call(
      GetNowPlayingMoviesParams parameters) async {
    return await baseMoviesRepository.getNowPlayingMovies(parameters);
  }
}
class GetNowPlayingMoviesParams {
  final int? page;

  GetNowPlayingMoviesParams({this.page=1});
}
