import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/dummy_data.dart';
import 'package:movies_app/movies/presentation/controllers/movie_details_bloc/movie_details_bloc.dart';
import 'package:movies_app/movies/presentation/widgets/movie_details_widgets/movie_details_appbar.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MovieDetailsAppbarBlocBuilder extends StatelessWidget {
  const MovieDetailsAppbarBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
      buildWhen: (previous, current) =>
          current is MovieDetailsLoading ||
          current is MovieDetailsSuccess ||
          current is MovieDetailsError && previous != current,
      builder: (context, state) {
        if (state is MovieDetailsSuccess) {
          return MovieDetailsAppBar(
            movieDetails: state.movieDetails,
          );
        } else if (state is MovieDetailsLoading) {
          return const Skeletonizer.sliver(
              child: MovieDetailsAppBar(movieDetails: dummyMovieDetails));
        } else {
          return const SliverToBoxAdapter(
            child: SizedBox.shrink(),
          );
        }
      },
    );
  }
}
