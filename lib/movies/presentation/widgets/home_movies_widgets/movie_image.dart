import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/helpers/assets.dart';
import 'package:movies_app/core/helpers/extensions.dart';
import 'package:movies_app/core/network/api_constants.dart';
import 'package:movies_app/core/routes/routes.dart';
import 'package:movies_app/core/utils/app_constants.dart';

class MovieImage extends StatelessWidget {
  const MovieImage(
      {super.key, required this.backdropPath, this.height, this.width, required this.movieID});
  final String? backdropPath;
  final double? height;
  final double? width;
  final int movieID;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          context.pushNamed(Routes.movieDetailsScreen, arguments: movieID),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: SizedBox(
          height: height ?? 170,
          child: CachedNetworkImage(
            imageUrl: backdropPath != null ? ApiConstants.imageUrl(backdropPath!) : AppConstants.imagesDefaultMovieImage,
            placeholder: (context, url) =>
                Image.asset(Assets.imagesLoadingAnimation),
            fit: BoxFit.cover,
            width: width ?? 120,
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
