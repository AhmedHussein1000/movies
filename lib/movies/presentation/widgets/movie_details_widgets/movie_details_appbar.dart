import 'package:movies_app/core/utils/app_constants.dart';
import 'package:movies_app/movies/domain/entities/movie_details_entity.dart';
import 'package:movies_app/core/helpers/assets.dart';
import 'package:movies_app/core/helpers/extensions.dart';
import 'package:movies_app/core/helpers/size_config.dart';
import 'package:movies_app/core/network/api_constants.dart';
import 'package:movies_app/core/routes/routes.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
class MovieDetailsAppBar extends StatelessWidget {
  const MovieDetailsAppBar({
    super.key,
    required this.movieDetails,
  });
  final MovieDetailsEntity movieDetails;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      actions: [
        TextButton(
          onPressed: () => context.pushNamedAndRemoveUntil(
            Routes.homeMoviesScreen,
            predicate: (route) => false,
          ),
          child: const Text('Back to Home'),
        )
      ],
      pinned: true,
      expandedHeight: SizeConfig.screenHeight * 0.3,
      flexibleSpace: FlexibleSpaceBar(
        background: CachedNetworkImage(
          fit: BoxFit.cover,
          height: SizeConfig.screenHeight * 0.3,
          imageUrl: movieDetails.backDropPath != null
              ? ApiConstants.imageUrl(movieDetails.backDropPath!)
              : AppConstants.imagesDefaultMovieImage,
          placeholder: (context, url) => Image.asset(
            Assets.imagesLoadingAnimation,
            fit: BoxFit.cover,
            height: SizeConfig.screenHeight * 0.3,
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
