
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/home/data/repos/home_repo.dart';
import 'package:movies_app/features/home/presentation/manager/latest_movies_cubit/latest_movies_state.dart';

class LatestMoviesCubit extends Cubit<LatestMoviesStates> {
  final HomeRepo homeRepo;
  LatestMoviesCubit(this.homeRepo) : super(LatestMoviesInitialState());

  Future<void> getLatestMovies()async{
    emit(LatestMoviesLoadingState());
    var result = await homeRepo.fetchLatestMovies();
    result.fold((failure){
      emit(LatestMoviesErrorState(errorMessage:failure.errorMessage));
    }, (movies){
      emit(LatestMoviesSuccessState(movies: movies));
    });
  }

}
