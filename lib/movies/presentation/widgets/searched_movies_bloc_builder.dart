import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/widgets/custom_text_message.dart';
import 'package:movies_app/movies/presentation/controllers/search_movies_bloc/search_movies_bloc.dart';
import 'package:movies_app/movies/presentation/widgets/movies_items_list.dart';
import 'package:movies_app/movies/presentation/widgets/movies_items_loading.dart';

class SearchedMoviesBlocBuilder extends StatelessWidget {
  const SearchedMoviesBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchMoviesBloc, SearchMoviesState>(
      builder: (context, state) {
        if (state is SearchMoviesSuccess) {
          return MoviesItemsList(movies: state.movies);
        } else if (state is SearchMoviesError) {
          return CustomTextMessage(text: state.message);
        } else if (state is SearchMoviesLoading) {
          return const MoviesItemsLoadingWidget();
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
