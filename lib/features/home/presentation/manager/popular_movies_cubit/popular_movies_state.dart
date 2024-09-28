import 'package:movies_app/features/home/data/model/movie_model.dart';

abstract class PopularMoviesStates{}
class PopularMoviesInitialState extends PopularMoviesStates{}
class PopularMoviesLoadingState extends PopularMoviesStates{}
class PopularMoviesSuccessState extends PopularMoviesStates{
  final List<MovieModel> movies;

  PopularMoviesSuccessState({required this.movies});
}
class PopularMoviesErrorState extends PopularMoviesStates{
  final String errorMessage;

  PopularMoviesErrorState({required this.errorMessage});
}
