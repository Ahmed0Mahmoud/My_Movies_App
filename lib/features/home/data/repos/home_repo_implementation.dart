import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/core/network/api_service.dart';
import 'package:movies_app/features/home/data/model/movie_model.dart';
import 'package:movies_app/features/home/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo{
  final ApiService apiService;

  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<MovieModel>>> fetchAllPosters()async {
    try {
      var data = await apiService.get(endpoint:'trending/tv/day?language=en-US&api_key=f730220a66b686080a77f5f1b3557f89');
      List<MovieModel> movies = [];
      for(var i in data['results']){
        movies.add(MovieModel.fromJson(i));
      }
      return Right(movies);
    } catch (e) {
      if(e is DioException){
        return Left(ServerFailure.fromDioException(e));
      }
      else{
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> fetchLatestMovies()async {
    try {
      var data = await apiService.get(endpoint: 'movie/upcoming?api_key=f730220a66b686080a77f5f1b3557f89&include_adult=false&page=2');
      List<MovieModel> movies = [];
      for(var i in data['results']){
        movies.add(MovieModel.fromJson(i));
      }
      return Right(movies);
    }catch (e) {
      if(e is DioException){
        return Left(ServerFailure.fromDioException(e));
      }
      else{
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> fetchPopularMovies()async {
    try {
      var data = await apiService.get(endpoint: 'movie/popular?api_key=f730220a66b686080a77f5f1b3557f89&include_adult=false');
      List<MovieModel> movies = [];
      for(var i in data['results']){
        movies.add(MovieModel.fromJson(i));
      }
      return Right(movies);
    }catch (e) {
      if(e is DioException){
        return Left(ServerFailure.fromDioException(e));
      }
      else{
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> fetchSimilarMovies({required int id}) async{
    try {
      var data = await apiService.get(endpoint: 'movie/$id/similar?api_key=f730220a66b686080a77f5f1b3557f89&include_adult=false');
      List<MovieModel> movies = [];
      for(var i in data['results']){
        movies.add(MovieModel.fromJson(i));
      }
      return Right(movies);
    }catch (e) {
      if(e is DioException){
        return Left(ServerFailure.fromDioException(e));
      }
      else{
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> fetchCategoryMovies({required String query}) async{
    try {
      var data = await apiService.get(endpoint: 'search/movie?query=$query&include_adult=false&page=1&api_key=f730220a66b686080a77f5f1b3557f89');
      List<MovieModel> movies = [];
      for(var i in data['results']){
        movies.add(MovieModel.fromJson(i));
      }
      return Right(movies);
    }catch (e) {
      if(e is DioException){
        return Left(ServerFailure.fromDioException(e));
      }
      else{
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> fetchSearchedMovies({required String query})async {
    try {
      var data = await apiService.get(endpoint: 'search/movie?query=$query&include_adult=false&page=1&api_key=f730220a66b686080a77f5f1b3557f89');
      List<MovieModel> movies = [];
      for(var i in data['results']){
        movies.add(MovieModel.fromJson(i));
      }
      return Right(movies);
    }catch (e) {
      if(e is DioException){
        return Left(ServerFailure.fromDioException(e));
      }
      else{
        return Left(ServerFailure(e.toString()));
      }
    }
  }



}