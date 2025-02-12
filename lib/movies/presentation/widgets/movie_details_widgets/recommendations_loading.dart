import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/dummy_data.dart';
import 'package:movies_app/movies/presentation/widgets/home_movies_widgets/movie_image.dart';
import 'package:skeletonizer/skeletonizer.dart';

class RecommendationsLoadingWidget extends StatelessWidget {
  const RecommendationsLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer.sliver(
        enabled: true,
        child: SliverPadding(
          padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
          sliver: SliverGrid.builder(
            itemCount: dummyRecommendations.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 120 / 170,
            ),
            itemBuilder: (context, index) => MovieImage(
              movieID: dummyRecommendations[index].id,
              backdropPath: dummyRecommendations[index].backdropPath,
            ),
          ),
        ));
  }
}
