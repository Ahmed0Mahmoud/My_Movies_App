
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/home/data/repos/home_repo.dart';
import 'package:movies_app/features/home/presentation/manager/similar_movies_cubit/similar_movies_state.dart';

class SimilarMoviesCubit extends Cubit<SimilarMoviesStateStates> {
  final HomeRepo homeRepo;
  SimilarMoviesCubit(this.homeRepo) : super(SimilarMoviesInitialState());

  Future<void> getSimilarMovies({required int id})async{
    emit(SimilarMoviesLoadingState());
    var result = await homeRepo.fetchSimilarMovies(id: id);
    result.fold((failure){
      emit(SimilarMoviesErrorState(errorMessage: failure.errorMessage));
    }, (movies){
      emit(SimilarMoviesSuccessState(movies: movies));
    });
  }
}
