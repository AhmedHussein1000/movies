import 'package:movies_app/movies/domain/entities/movie_details_entity.dart';
import 'package:movies_app/movies/domain/entities/movie_entity.dart';
import 'package:movies_app/movies/domain/entities/recommendation_entity.dart';

const MovieDetailsEntity dummyMovieDetails = MovieDetailsEntity(
  id: 453395,
  overview:
      "Doctor Strange, with the help of mystical allies both old and new, traverses the mind-bending and dangerous alternate realities of the Multiverse to confront a mysterious new adversary.",
  backDropPath: '/nmGWzTLMXy9x7mKd8NKPLmHtWGa.jpg',
  runTime: 100,
  releaseDate: "2022-05-04",
  title: "Movie Title",
  voteAverage: 5.0,
  genres: [],
);
const MovieEntity dummyMovie = MovieEntity(
  backDropPath: "/nmGWzTLMXy9x7mKd8NKPLmHtWGa.jpg",
  id: 453395,
  overview:
      "Doctor Strange, with the help of mystical allies both old and new, traverses the mind-bending and dangerous alternate realities of the Multiverse to confront a mysterious new adversary.",
  releaseDate: "2022-05-04",
  name: "Movie Title",
  voteAverage: 5.0,
);
const List<MovieEntity> dummyMoviesList = [
  dummyMovie,
  dummyMovie,
  dummyMovie,
  dummyMovie,
  dummyMovie,
];

const RecommendationEntity dummyRecommendation = RecommendationEntity(
    id: 453395, backdropPath: "/nmGWzTLMXy9x7mKd8NKPLmHtWGa.jpg");
const List<RecommendationEntity> dummyRecommendations = [
  dummyRecommendation,
  dummyRecommendation,
  dummyRecommendation,
  dummyRecommendation,
  dummyRecommendation,
];
