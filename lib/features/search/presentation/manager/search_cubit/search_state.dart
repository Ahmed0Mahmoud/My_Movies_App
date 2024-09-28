import 'package:movies_app/features/home/data/model/movie_model.dart';

abstract class SearchStates{}
class SearchInitialState extends SearchStates{}
class SearchLoadingState extends SearchStates{}
class SearchSuccessState extends SearchStates{
  final List<MovieModel> movies;

  SearchSuccessState({required this.movies});
}
class SearchErrorState extends SearchStates{
  final String errorMessage;

  SearchErrorState({required this.errorMessage});
}
