import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:movies_app/core/helpers/extensions.dart';
import 'package:movies_app/core/helpers/size_config.dart';
import 'package:movies_app/core/routes/routes.dart';
import 'package:movies_app/core/themes/app_colors.dart';
import 'package:movies_app/core/utils/app_constants.dart';
import 'package:movies_app/movies/presentation/controllers/home_movies_bloc/home_movies_bloc.dart';
import 'package:movies_app/movies/presentation/widgets/home_movies_widgets/now_playing_movies_bloc_consumer.dart';
import 'package:movies_app/movies/presentation/widgets/popular_movies_bloc_consumer.dart';
import 'package:movies_app/movies/presentation/widgets/home_movies_widgets/see_more_widget.dart';
import 'package:movies_app/movies/presentation/widgets/top_rated_movies_bloc_consumer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Icon(FontAwesomeIcons.magnifyingGlass),
          onPressed: () => context.pushNamed(Routes.searchMoviesScreen)),
      body: RefreshIndicator(
        color: AppColors.redPrimaryColor,
        onRefresh: () async {
          context.read<HomeMoviesBloc>().add(GetNowPlayingMoviesEvent());
          context.read<HomeMoviesBloc>().add(GetPopularMoviesEvent());
          context.read<HomeMoviesBloc>().add(GetTopRatedMoviesEvent());
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              const NowPlayingMoviesBlocConsumer(),
              SeeMoreWidget(
                onTap: () => context.pushNamed(Routes.popularMoviesScreen),
                title: AppConstants.popular,
              ),
              const PopularMoviesBlocConsumer(),
              SeeMoreWidget(
                onTap: () => context.pushNamed(Routes.topRatedMoviesScreen),
                title: AppConstants.topRated,
              ),
              const TopRatedMoviesBlocConsumer(),
              const SizedBox(
                height: 70,
              )
            ],
          ),
        ),
      ),
    );
  }
}
