import 'package:movies_app/features/home/data/model/movie_model.dart';

abstract class PostersStates{}
class PostersInitialState extends PostersStates{}
class PostersLoadingState extends PostersStates{}
class PostersSuccessState extends PostersStates{
  final List<MovieModel> movies;

  PostersSuccessState({required this.movies});
}
class PostersErrorState extends PostersStates{
  final String errorMessage;

  PostersErrorState({required this.errorMessage});
}
