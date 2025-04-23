import 'package:flutter/material.dart';
import 'package:movies_app/core/helpers/extensions.dart';
import 'package:movies_app/core/themes/app_colors.dart';
import 'package:movies_app/core/themes/app_styles.dart';
import 'package:movies_app/core/utils/app_constants.dart';

class MovieReleaseYearAndRate extends StatelessWidget {
  const MovieReleaseYearAndRate(
      {super.key,
      this.containerBgColor,
      required this.releaseDate,
      required this.rate});
  final Color? containerBgColor;
  final String? releaseDate;
  final double rate;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: containerBgColor ?? AppColors.redPrimaryColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            !releaseDate.isNullOrEmpty()
                ? _getReleaseYear(releaseDate: releaseDate!)
                : AppConstants.unknown,
            style: Styles.styleMedium18(context),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Row(
          children: [
            const Icon(
              Icons.star,
              color: Colors.amber,
              size: 20,
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              rate.toStringAsFixed(1), style: Styles.styleRegular16(context),
            )
          ],
        )
      ],
    );
  }

  String _getReleaseYear({required String releaseDate}) {
    return releaseDate.split('-')[0];
  }
}
