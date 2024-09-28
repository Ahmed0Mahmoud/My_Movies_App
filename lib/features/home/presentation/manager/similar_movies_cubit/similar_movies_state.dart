import 'package:movies_app/features/home/data/model/movie_model.dart';

abstract class SimilarMoviesStateStates{}
class SimilarMoviesInitialState extends SimilarMoviesStateStates{}
class SimilarMoviesLoadingState extends SimilarMoviesStateStates{}
class SimilarMoviesSuccessState extends SimilarMoviesStateStates{
  final List<MovieModel> movies;

  SimilarMoviesSuccessState({required this.movies});
}
class SimilarMoviesErrorState extends SimilarMoviesStateStates{
  final String errorMessage;

  SimilarMoviesErrorState({required this.errorMessage});
}
