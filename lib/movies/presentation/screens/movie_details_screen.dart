import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/themes/app_colors.dart';
import 'package:movies_app/movies/presentation/controllers/movie_details_bloc/movie_details_bloc.dart';
import 'package:movies_app/movies/presentation/widgets/movie_details_widgets/movie_details_screen_body.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({
    super.key,
    required this.movieId,
  });
  final int movieId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        color: AppColors.redPrimaryColor,
        onRefresh: () async {
          context.read<MovieDetailsBloc>().add(GetMovieDetailsEvent(movieId));
          context
              .read<MovieDetailsBloc>()
              .add(GetRecommendationsEvent(movieId));
        },
        child:  MovieDetailsScreenBody(movieId: movieId,),
      ),
    );
  }
}
