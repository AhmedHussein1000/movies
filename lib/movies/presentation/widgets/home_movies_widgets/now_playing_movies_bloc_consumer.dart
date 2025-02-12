import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/functions/show_toast.dart';
import 'package:movies_app/core/helpers/assets.dart';
import 'package:movies_app/core/helpers/size_config.dart';
import 'package:movies_app/core/network/api_constants.dart';
import 'package:movies_app/core/themes/app_styles.dart';
import 'package:movies_app/core/utils/app_constants.dart';
import 'package:movies_app/core/utils/dummy_data.dart';
import 'package:movies_app/core/widgets/custom_text_message.dart';
import 'package:movies_app/movies/domain/entities/movie_entity.dart';
import 'package:movies_app/movies/presentation/controllers/home_movies_bloc/home_movies_bloc.dart';
import 'package:movies_app/movies/presentation/widgets/home_movies_widgets/now_playing_movies_list.dart';
import 'package:skeletonizer/skeletonizer.dart';

class NowPlayingMoviesBlocConsumer extends StatefulWidget {
  const NowPlayingMoviesBlocConsumer({super.key});

  @override
  State<NowPlayingMoviesBlocConsumer> createState() =>
      _NowPlayingMoviesBlocConsumerState();
}

class _NowPlayingMoviesBlocConsumerState
    extends State<NowPlayingMoviesBlocConsumer> {
  List<MovieEntity> movies = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeMoviesBloc, HomeMoviesState>(
      listener: (context, state) {
        if (state is NowPlayingMoviesSuccess) {
          movies.addAll(state.nowPlayingMovies);
        }
        if (state is NowPlayingMoviesPaginationError) {
          customToast(message: state.errorMessage, state: ToastStates.error);
        }
      },
      buildWhen: (previous, current) =>
          current is NowPlayingMoviesLoading ||
          current is NowPlayingMoviesSuccess ||
          current is NowPlayingMoviesError ||
          current is NowPlayingMoviesPaginationLoading ||
          current is NowPlayingMoviesPaginationError ||
          current is NowPlayingMoviesNoMoreData,
      builder: (context, state) {
        if (state is NowPlayingMoviesSuccess ||
            state is NowPlayingMoviesPaginationLoading ||
            state is NowPlayingMoviesPaginationError ||
            state is NowPlayingMoviesNoMoreData) {
          return NowPlayingMoviesList(
            movies: movies,
          );
        } else if (state is NowPlayingMoviesError) {
          return SizedBox(
              height: SizeConfig.screenHeight * 0.40,
              child: CustomTextMessage(text: state.errorMessage));
        } else {
          return Skeletonizer(
            enabled: true,
            child: NowPlayingMovieImage(
                backdropPath: dummyMovie.backDropPath, name: dummyMovie.name),
          );
        }
      },
    );
  }
}

class NowPlayingMovieImage extends StatelessWidget {
  const NowPlayingMovieImage({
    super.key,
    required this.backdropPath,
    required this.name,
  });
  final String? backdropPath;
  final String? name;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        CachedNetworkImage(
          imageUrl: backdropPath != null
              ? ApiConstants.imageUrl(backdropPath!)
              : AppConstants.imagesDefaultMovieImage,
          placeholder: (context, url) =>
              Image.asset(Assets.imagesLoadingAnimation),
          fit: BoxFit.cover,
          height: SizeConfig.screenHeight * 0.40,
          width: double.infinity,
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        Container(
          color: Colors.black26,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.circle,
                    color: Colors.red,
                    size: 16,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Now Playing',
                    style: Styles.styleSemiBold18(context)
                        .copyWith(color: Colors.grey.shade400),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                name ?? AppConstants.unknownName,
                style: Styles.styleSemiBold24(context)
                    .copyWith(color: Colors.grey.shade400),
              ),
            ],
          ),
        )
      ],
    );
  }
}
