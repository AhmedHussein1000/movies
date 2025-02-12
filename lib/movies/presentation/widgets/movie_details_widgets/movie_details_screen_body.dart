import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/themes/app_styles.dart';
import 'package:movies_app/core/utils/app_constants.dart';
import 'package:movies_app/movies/presentation/controllers/movie_details_bloc/movie_details_bloc.dart';
import 'package:movies_app/movies/presentation/widgets/movie_details_widgets/movie_details_appbar_bloc_builder.dart';
import 'package:movies_app/movies/presentation/widgets/movie_details_widgets/movie_details_item_bloc_builder.dart';
import 'package:movies_app/movies/presentation/widgets/movie_details_widgets/recommendations_grid_bloc_consumer.dart';

class MovieDetailsScreenBody extends StatefulWidget {
  const MovieDetailsScreenBody({
    super.key,
    required this.movieId,
  });
  final int movieId;

  @override
  State<MovieDetailsScreenBody> createState() => _MovieDetailsScreenBodyState();
}

class _MovieDetailsScreenBodyState extends State<MovieDetailsScreenBody> {
  late final ScrollController _controller;
  bool isLoading = false;
  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_loadNextPage);
    super.initState();
  }

  void _loadNextPage() async {
    if (_controller.position.pixels >=
        _controller.position.maxScrollExtent * 0.8) {
      if (!isLoading &&
          context.read<MovieDetailsBloc>().state
              is! RecommendationsNoMoreData) {
        isLoading = true;
        context
            .read<MovieDetailsBloc>()
            .add(GetRecommendationsEvent(widget.movieId));
        await Future.delayed(const Duration(seconds: 2));
        isLoading = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _controller,
      slivers: [
        const MovieDetailsAppbarBlocBuilder(),
        const MovieDetailsItemBlocBuilder(),
        SliverToBoxAdapter(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            AppConstants.moreLikeThis.toUpperCase(),
            style: Styles.styleMedium20(context),
          ),
        )),
        const RecommendationsGridBlocConsumer()
      ],
    );
  }
}
