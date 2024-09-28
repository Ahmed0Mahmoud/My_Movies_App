import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/features/home/data/model/movie_model.dart';

abstract class HomeRepo{
  Future<Either<Failure,List<MovieModel>>> fetchAllPosters();
  Future<Either<Failure,List<MovieModel>>> fetchPopularMovies();
  Future<Either<Failure,List<MovieModel>>> fetchLatestMovies();
  Future<Either<Failure,List<MovieModel>>> fetchSimilarMovies({required int id});
  Future<Either<Failure,List<MovieModel>>> fetchCategoryMovies({required String query});
  Future<Either<Failure,List<MovieModel>>> fetchSearchedMovies({required String query});

}