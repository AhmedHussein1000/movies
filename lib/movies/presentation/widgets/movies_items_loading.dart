import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/dummy_data.dart';
import 'package:movies_app/movies/presentation/widgets/movie_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MoviesItemsLoadingWidget extends StatelessWidget {
  const MoviesItemsLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true
      ,child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(vertical: 16),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 16,
                ),
                itemCount: dummyMoviesList.length,
                itemBuilder: (context, index) =>
                    MovieItem(movie: dummyMoviesList[index]),
              ) );
  }
}