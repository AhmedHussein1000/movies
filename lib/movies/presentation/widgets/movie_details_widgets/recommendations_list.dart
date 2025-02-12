import 'package:flutter/material.dart';
import 'package:movies_app/movies/domain/entities/recommendation_entity.dart';
import 'package:movies_app/movies/presentation/widgets/home_movies_widgets/movie_image.dart';


class RecommendationsList extends StatelessWidget {
  const RecommendationsList({
    super.key,
    required this.recommendations,
  });

  final List<RecommendationEntity> recommendations;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
      sliver: SliverGrid.builder(
        itemCount: recommendations.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 120 / 170,
        ),
        itemBuilder: (context, index) => MovieImage(
          movieID: recommendations[index].id,
          backdropPath: recommendations[index].backdropPath,
        ),
      ),
    );
  }
}
