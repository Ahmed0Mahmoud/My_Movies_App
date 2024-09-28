import 'package:movies_app/features/home/data/model/movie_model.dart';

abstract class CategorysStates{}
class CategorysInitialState extends CategorysStates{}
class CategorysLoadingState extends CategorysStates{}
class CategorysSuccessState extends CategorysStates{
  final List<MovieModel> movies;

  CategorysSuccessState({required this.movies});
}
class CategorysErrorState extends CategorysStates{
  final String errorMessage;

  CategorysErrorState({required this.errorMessage});
}
