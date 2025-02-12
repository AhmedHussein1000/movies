import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/dummy_data.dart';
import 'package:movies_app/movies/presentation/widgets/home_movies_widgets/movie_image.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeMoviesLoadingWidget extends StatelessWidget {
  const HomeMoviesLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
        enabled: true,
        child: SizedBox(
          height: 170,
          child: ListView.separated(
            
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            separatorBuilder: (context, index) => const SizedBox(
              width: 8,
            ),
            itemCount: dummyMoviesList.length,
            itemBuilder: (context, index) => MovieImage(
              movieID: dummyMoviesList[index].id,
              backdropPath: dummyMoviesList[index].backDropPath,
            ),
          ),
        ));
  }
}
