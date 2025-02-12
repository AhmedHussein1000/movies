import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_constants.dart';
import 'package:movies_app/movies/presentation/widgets/popular_movies_bloc_consumer.dart';

class PopularMoviesScreen extends StatelessWidget {
  const PopularMoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.popularMovies),
      ),
      body: const PopularMoviesBlocConsumer(isPopularScreen: true,),
    );
  }
}