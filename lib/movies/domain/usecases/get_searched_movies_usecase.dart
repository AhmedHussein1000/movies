import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movies/domain/entities/movie_entity.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';

class GetSearchedMoviesUsecase
    extends BaseUsecase<List<MovieEntity>, GetSearchedMoviesParams> {
  final BaseMoviesRepository baseMoviesRepository;
  GetSearchedMoviesUsecase(this.baseMoviesRepository);
  @override
  Future<Either<Failure, List<MovieEntity>>> call(
      GetSearchedMoviesParams parameters) async{
    return await baseMoviesRepository.getSearchedMovies(parameters);
  }
}

class GetSearchedMoviesParams {
  final String query;

  const GetSearchedMoviesParams({required this.query});
}
