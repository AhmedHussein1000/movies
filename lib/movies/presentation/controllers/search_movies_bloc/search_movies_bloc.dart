import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/movies/domain/entities/movie_entity.dart';
import 'package:movies_app/movies/domain/usecases/get_searched_movies_usecase.dart';

part 'search_movies_event.dart';
part 'search_movies_state.dart';

class SearchMoviesBloc extends Bloc<SearchMoviesEvent, SearchMoviesState> {
  final GetSearchedMoviesUsecase _getSearchedMoviesUsecase;
  SearchMoviesBloc(this._getSearchedMoviesUsecase)
      : super(SearchMoviesInitial()) {
    on<GetSearchedMoviesEvent>(_getSearchedMovies);
  }
  FutureOr<void> _getSearchedMovies(
      GetSearchedMoviesEvent event, Emitter<SearchMoviesState> emit) async {
    emit(SearchMoviesLoading());
    var result = await _getSearchedMoviesUsecase(
        GetSearchedMoviesParams(query: event.query));
    result.fold((failure) => emit(SearchMoviesError(message: failure.message)),
        (movies) => emit(SearchMoviesSuccess(movies: movies)));
  }
}
