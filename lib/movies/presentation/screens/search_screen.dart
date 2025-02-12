import 'package:flutter/material.dart';
import 'package:movies_app/movies/presentation/widgets/search_movie_body.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child:  SearchMovieBody()),
    );
  }
}