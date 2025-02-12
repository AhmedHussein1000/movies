
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/helpers/extensions.dart';
import 'package:movies_app/core/helpers/size_config.dart';
import 'package:movies_app/core/routes/routes.dart';
import 'package:movies_app/movies/domain/entities/movie_entity.dart';
import 'package:movies_app/movies/presentation/controllers/home_movies_bloc/home_movies_bloc.dart';
import 'package:movies_app/movies/presentation/widgets/home_movies_widgets/now_playing_movies_bloc_consumer.dart';

class NowPlayingMoviesList extends StatefulWidget {
  const NowPlayingMoviesList({
    super.key,
    required this.movies,
  });
  final List<MovieEntity> movies;
  @override
  State<NowPlayingMoviesList> createState() => _NowPlayingMoviesListState();
}

class _NowPlayingMoviesListState extends State<NowPlayingMoviesList> {
  late final CarouselSliderController _carouselController;
  bool isLoading = false;
  @override
  void initState() {
    _carouselController = CarouselSliderController();
    super.initState();
  }
 
  void _loadNextPage() async {
    if (!isLoading&&context.read<HomeMoviesBloc>().state is! NowPlayingMoviesNoMoreData) {
      isLoading = true;
      context.read<HomeMoviesBloc>().add(GetNowPlayingMoviesEvent());
      await Future.delayed(const Duration(seconds: 2));
      isLoading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        carouselController: _carouselController,
        items: widget.movies
            .map((movie) => GestureDetector(
                  onTap: () => context.pushNamed(Routes.movieDetailsScreen,
                      arguments: movie.id),
                  child: NowPlayingMovieImage(
                    backdropPath: movie.backDropPath,
                    name: movie.name ,
                  ),
                ))
            .toList(),
        options: CarouselOptions(
          height: SizeConfig.screenHeight * 0.40,
          viewportFraction: 1.0,
          onPageChanged: (index, reason) {
            if (index >= widget.movies.length - 4) {
              _loadNextPage();
            }
          },
        ));
  }
}