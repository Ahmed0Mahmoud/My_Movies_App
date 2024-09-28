import 'package:movies_app/features/home/data/model/movie_model.dart';

abstract class LatestMoviesStates{}
class LatestMoviesInitialState extends LatestMoviesStates{}
class LatestMoviesLoadingState extends LatestMoviesStates{}
class LatestMoviesSuccessState extends LatestMoviesStates{
  final List<MovieModel> movies;

  LatestMoviesSuccessState({required this.movies});
}
class LatestMoviesErrorState extends LatestMoviesStates{
  final String errorMessage;

  LatestMoviesErrorState({required this.errorMessage});
}
