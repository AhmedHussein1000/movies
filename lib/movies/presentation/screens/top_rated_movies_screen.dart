import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_constants.dart';
import 'package:movies_app/movies/presentation/widgets/top_rated_movies_bloc_consumer.dart';

class TopRatedMoviesScreen extends StatelessWidget {
  const TopRatedMoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.topRatedMovies),
      ),
      body: const TopRatedMoviesBlocConsumer(isTopRatedScreen: true,),
    );
  }
}
