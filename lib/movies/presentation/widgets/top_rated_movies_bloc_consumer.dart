import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/functions/show_toast.dart';
import 'package:movies_app/core/widgets/custom_text_message.dart';
import 'package:movies_app/movies/domain/entities/movie_entity.dart';
import 'package:movies_app/movies/presentation/controllers/home_movies_bloc/home_movies_bloc.dart';
import 'package:movies_app/movies/presentation/widgets/home_movies_widgets/home_movies_loading.dart';
import 'package:movies_app/movies/presentation/widgets/home_movies_widgets/movie_image.dart';
import 'package:movies_app/movies/presentation/widgets/movies_items_list.dart';
import 'package:movies_app/movies/presentation/widgets/movies_items_loading.dart';

class TopRatedMoviesBlocConsumer extends StatefulWidget {
  const TopRatedMoviesBlocConsumer({super.key, this.isTopRatedScreen = false});
  final bool? isTopRatedScreen;
  @override
  State<TopRatedMoviesBlocConsumer> createState() =>
      _TopRatedMoviesBlocConsumerState();
}

class _TopRatedMoviesBlocConsumerState
    extends State<TopRatedMoviesBlocConsumer> {
  List<MovieEntity> movies = [];
  bool isLoading = false;
  late final ScrollController _scrollController;
  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_loadNextPage);

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _loadNextPage() async {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.8) {
      if (!isLoading &&
          context.read<HomeMoviesBloc>().state is! TopRatedMoviesNoMoreData) {
        isLoading = true;
        context.read<HomeMoviesBloc>().add(GetTopRatedMoviesEvent());
        await Future.delayed(const Duration(seconds: 2));
        isLoading = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeMoviesBloc, HomeMoviesState>(
      listener: (context, state) {
        if (state is TopRatedMoviesSuccess) {
          movies.addAll(state.topRatedMovies);
        }
        if (state is TopRatedMoviesPaginationError) {
          customToast(message: state.errorMessage, state: ToastStates.error);
        }
      },
      buildWhen: (previous, current) =>
          current is TopRatedMoviesLoading ||
          current is TopRatedMoviesSuccess ||
          current is TopRatedMoviesError ||
          current is TopRatedMoviesPaginationLoading ||
          current is TopRatedMoviesPaginationError ||
          current is TopRatedMoviesNoMoreData,
      builder: (context, state) {
        if (state is TopRatedMoviesSuccess ||
            state is TopRatedMoviesPaginationLoading ||
            state is TopRatedMoviesPaginationError ||
            state is TopRatedMoviesNoMoreData) {
          return widget.isTopRatedScreen == true
              ? MoviesItemsList(
                  movies: movies,
                  scrollController: _scrollController,
                )
              : SizedBox(
                  height: 170,
                  child: ListView.separated(
                    controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 8,
                    ),
                    itemCount: movies.length,
                    itemBuilder: (context, index) => MovieImage(
                      movieID: movies[index].id,
                      backdropPath: movies[index].backDropPath,
                    ),
                  ),
                );
        } else if (state is TopRatedMoviesError) {
          return widget.isTopRatedScreen == true
              ? CustomTextMessage(text: state.errorMessage)
              : SizedBox(
                  height: 170,
                  child: CustomTextMessage(text: state.errorMessage),
                );
        } else {
          return widget.isTopRatedScreen == true
              ? const MoviesItemsLoadingWidget()
              : const HomeMoviesLoadingWidget();
        }
      },
    );
  }
}
