import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/di/service_locator.dart';
import 'package:movies_app/core/routes/routes.dart';
import 'package:movies_app/core/widgets/no_route_defined_screen.dart';
import 'package:movies_app/movies/presentation/controllers/movie_details_bloc/movie_details_bloc.dart';
import 'package:movies_app/movies/presentation/controllers/home_movies_bloc/home_movies_bloc.dart';
import 'package:movies_app/movies/presentation/controllers/search_movies_bloc/search_movies_bloc.dart';
import 'package:movies_app/movies/presentation/screens/movie_details_screen.dart';
import 'package:movies_app/movies/presentation/screens/home_screen.dart';
import 'package:movies_app/movies/presentation/screens/popular_movies_screen.dart';
import 'package:movies_app/movies/presentation/screens/search_screen.dart';
import 'package:movies_app/movies/presentation/screens/top_rated_movies_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.homeMoviesScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => HomeMoviesBloc(getIt(), getIt(), getIt())
              ..add(GetNowPlayingMoviesEvent())
              ..add(GetPopularMoviesEvent())
              ..add(GetTopRatedMoviesEvent()),
            child: const HomeScreen(),
          ),
        );
      case Routes.movieDetailsScreen:
        final int movieId = arguments as int;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => MovieDetailsBloc(getIt(), getIt())
              ..add(GetMovieDetailsEvent(movieId))
              ..add(GetRecommendationsEvent(movieId)),
            child: MovieDetailsScreen(
              movieId: movieId,
            ),
          ),
        );
      case Routes.popularMoviesScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => HomeMoviesBloc(getIt(), getIt(), getIt())
              ..add(GetPopularMoviesEvent()),
            child: const PopularMoviesScreen(),
          ),
        );
      case Routes.topRatedMoviesScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => HomeMoviesBloc(getIt(), getIt(), getIt())
              ..add(GetTopRatedMoviesEvent()),
            child: const TopRatedMoviesScreen(),
          ),
        );
        case Routes.searchMoviesScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => SearchMoviesBloc(getIt()),
            child: const SearchScreen(),
        ));
      default:
        return MaterialPageRoute(
          builder: (_) => const NoRouteDefinedScreen(),
        );
    }
  }
}
