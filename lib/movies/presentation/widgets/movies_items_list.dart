
import 'package:flutter/material.dart';
import 'package:movies_app/movies/domain/entities/movie_entity.dart';
import 'package:movies_app/movies/presentation/widgets/movie_item.dart';

class MoviesItemsList extends StatelessWidget {
  const MoviesItemsList({
    super.key,
    required this.movies,  this.scrollController,
  });

  final List<MovieEntity> movies;
  final ScrollController? scrollController;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: scrollController,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 16),
        separatorBuilder: (context, index) => const SizedBox(
          height: 16,
        ),
        itemCount: movies.length,
        itemBuilder: (context, index) =>
            MovieItem(movie: movies[index]),
      );
  }
}