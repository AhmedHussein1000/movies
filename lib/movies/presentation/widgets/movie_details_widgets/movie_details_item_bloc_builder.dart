import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/dummy_data.dart';
import 'package:movies_app/core/widgets/custom_text_message.dart';
import 'package:movies_app/movies/presentation/controllers/movie_details_bloc/movie_details_bloc.dart';
import 'package:movies_app/movies/presentation/widgets/movie_details_widgets/movie_details_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MovieDetailsItemBlocBuilder extends StatelessWidget {
  const MovieDetailsItemBlocBuilder({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
        buildWhen: (previous, current) =>
            current is MovieDetailsLoading ||
            current is MovieDetailsSuccess ||
            current is MovieDetailsError && previous != current,
        builder: (context, state) {
          if (state is MovieDetailsSuccess) {
            return SliverToBoxAdapter(
              child: MovieDetailsItem(movieDetails: state.movieDetails),
            );
          } else if (state is MovieDetailsError) {
            return SliverToBoxAdapter(
              child: CustomTextMessage(text: state.errorMessage),
            );
          } else {
            return const Skeletonizer.sliver(
                child: SliverToBoxAdapter(
                    child: MovieDetailsItem(movieDetails: dummyMovieDetails)));
          }
        });
  }
}
