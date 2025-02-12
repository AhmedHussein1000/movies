import 'package:flutter/material.dart';
import 'package:movies_app/core/helpers/extensions.dart';
import 'package:movies_app/core/themes/app_styles.dart';
import 'package:movies_app/core/utils/app_constants.dart';
import 'package:movies_app/core/widgets/movie_release_year_and_rate.dart';
import 'package:movies_app/movies/domain/entities/genre_entity.dart';
import 'package:movies_app/movies/domain/entities/movie_details_entity.dart';

class MovieDetailsItem extends StatelessWidget {
  const MovieDetailsItem({super.key, required this.movieDetails});
  final MovieDetailsEntity movieDetails;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            movieDetails.title ?? AppConstants.unknownName,
            style: Styles.styleSemiBold20(context),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 24),
            child: Row(
              children: [
                MovieReleaseYearAndRate(
                    releaseDate: movieDetails.releaseDate,
                    rate: movieDetails.voteAverage ?? 0.0),
                const SizedBox(
                  width: 24,
                ),
                Text(
                  movieDetails.runTime == null
                      ? ''
                      : _getRunTime(runTime: movieDetails.runTime!),
                  style: Styles.styleRegular16(context)
                      .copyWith(color: Colors.grey.shade400),
                ),
              ],
            ),
          ),
          Text(
            movieDetails.overview ?? '',
            style: Styles.styleRegular16(context),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 32),
            child: Text(
              _getGenres(genres: movieDetails.genres),
              style: Styles.styleMedium18(context),
            ),
          )
        ]));
  }

  String _getRunTime({required int runTime}) {
    int minutes = runTime % 60;
    int hours = runTime ~/ 60;
    if (hours == 0) {
      return '$minutes min';
    } else {
      return '$hours h $minutes min';
    }
  }

  String _getGenres({required List<GenreEntity>? genres}) {
    String genresString = 'Genres: ';
    if (!genres.isNullOrEmpty()) {
      for (int i = 0; i < genres!.length; i++) {
        if (genres[i].name != null) {
          if (i == genres.length - 1) {
            genresString += genres[i].name!;
          } else {
            genresString += '${genres[i].name}, ';
          }
        }
      }
      return genresString;
    }
    return genresString += 'unknown';
  }
}
