import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/widgets/custom_text_field.dart';
import 'package:movies_app/movies/presentation/controllers/search_movies_bloc/search_movies_bloc.dart';
import 'package:movies_app/movies/presentation/widgets/searched_movies_bloc_builder.dart';

class SearchMovieBody extends StatefulWidget {
  const SearchMovieBody({super.key});

  @override
  State<SearchMovieBody> createState() => _SearchMovieBodyState();
}

class _SearchMovieBodyState extends State<SearchMovieBody> {
    late final TextEditingController searchController;
  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
            CustomTextfield(
                  hintText: 'Search here',
                  controller: searchController,
                  suffixIcon: IconButton(
                      onPressed: () {
                        searchController.clear();
                        context
                            .read<SearchMoviesBloc>()
                            .add(GetSearchedMoviesEvent(query: searchController.text));
                      },
                      icon: const Icon(Icons.clear)),
                  onChanged: (value) {
                    searchController.text = value;
                   context.read<SearchMoviesBloc>().add(GetSearchedMoviesEvent(query: searchController.text));
                  },
                ),
          const SizedBox(
            height: 30,
          ),
        const  Expanded(child:  SearchedMoviesBlocBuilder())  

          
        ],
      ),
    );
  }
}