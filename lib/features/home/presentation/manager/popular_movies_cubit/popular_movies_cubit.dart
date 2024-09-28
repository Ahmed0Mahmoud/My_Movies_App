
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/home/data/repos/home_repo.dart';
import 'package:movies_app/features/home/presentation/manager/popular_movies_cubit/popular_movies_state.dart';

class PopularMoviesCubit extends Cubit<PopularMoviesStates> {
  final HomeRepo homeRepo;
  PopularMoviesCubit(this.homeRepo) : super(PopularMoviesInitialState());

  Future<void> getPopularMovies()async{
    emit(PopularMoviesLoadingState());
    var result = await homeRepo.fetchPopularMovies();
    result.fold((failure){
      emit(PopularMoviesErrorState(errorMessage: failure.errorMessage));
    }, (movies){
      emit(PopularMoviesSuccessState(movies: movies));
    });
  }
}
