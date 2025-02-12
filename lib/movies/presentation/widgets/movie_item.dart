import 'package:flutter/material.dart';
import 'package:movies_app/core/helpers/extensions.dart';
import 'package:movies_app/core/routes/routes.dart';
import 'package:movies_app/core/themes/app_styles.dart';
import 'package:movies_app/core/utils/app_constants.dart';
import 'package:movies_app/core/widgets/movie_release_year_and_rate.dart';
import 'package:movies_app/movies/domain/entities/movie_entity.dart';
import 'package:movies_app/movies/presentation/widgets/home_movies_widgets/movie_image.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({super.key, required this.movie});
  final MovieEntity movie;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          context.pushNamed(Routes.movieDetailsScreen, arguments: movie.id),
      child: Container(
        padding: const EdgeInsets.all(8),
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0x89403F3F)),
        child: Row(
          children: [
            MovieImage(
              backdropPath: movie.backDropPath,
              movieID: movie.id,
              height: 150,
              width: 105,
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.name ?? AppConstants.unknownName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.styleMedium20(context),
                ),
                const SizedBox(
                  height: 8,
                ),
                MovieReleaseYearAndRate(
                    releaseDate: movie.releaseDate  ,
                    rate: movie.voteAverage ?? 0.0),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  movie.overview ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.styleRegular16(context),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
