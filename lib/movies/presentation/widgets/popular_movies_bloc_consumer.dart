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

class PopularMoviesBlocConsumer extends StatefulWidget {
  const PopularMoviesBlocConsumer({super.key, this.isPopularScreen = false});
  final bool? isPopularScreen;
  @override
  State<PopularMoviesBlocConsumer> createState() =>
      _PopularMoviesBlocConsumerState();
}

class _PopularMoviesBlocConsumerState extends State<PopularMoviesBlocConsumer> {
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
          context.read<HomeMoviesBloc>().state is! PopularMoviesNoMoreData) {
        isLoading = true;
        context.read<HomeMoviesBloc>().add(GetPopularMoviesEvent());
        await Future.delayed(const Duration(seconds: 2));
        isLoading = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeMoviesBloc, HomeMoviesState>(
      listener: (context, state) {
        if (state is PopularMoviesSuccess) {
          movies.addAll(state.popularMovies);
        }
        if (state is PopularMoviesPaginationError) {
          customToast(message: state.errorMessage, state: ToastStates.error);
        }
      },
      buildWhen: (previous, current) =>
          current is PopularMoviesLoading ||
          current is PopularMoviesSuccess ||
          current is PopularMoviesError ||
          current is PopularMoviesPaginationLoading ||
          current is PopularMoviesPaginationError ||
          current is PopularMoviesNoMoreData,
      builder: (context, state) {
        if (state is PopularMoviesSuccess ||
            state is PopularMoviesPaginationLoading ||
            state is PopularMoviesPaginationError ||
            state is PopularMoviesNoMoreData) {
          return widget.isPopularScreen == true
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
        } else if (state is PopularMoviesError) {
          return widget.isPopularScreen == true
              ? CustomTextMessage(text: state.errorMessage)
              : SizedBox(
                  height: 170,
                  child: CustomTextMessage(text: state.errorMessage),
                );
        } else {
          return widget.isPopularScreen == true
              ? const MoviesItemsLoadingWidget()
              : const HomeMoviesLoadingWidget();
        }
      },
    );
  }
}
