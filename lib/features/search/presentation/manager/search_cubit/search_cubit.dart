
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/home/data/repos/home_repo.dart';
import 'package:movies_app/features/search/presentation/manager/search_cubit/search_state.dart';

class SearchCubit extends Cubit<SearchStates> {
  final HomeRepo homeRepo;
  SearchCubit(this.homeRepo) : super(SearchInitialState());

  Future<void> getSearchMovies({required String query})async{
    emit(SearchLoadingState());
    var result = await homeRepo.fetchSearchedMovies(query: query);
    result.fold((failure){
      emit(SearchErrorState(errorMessage: failure.errorMessage));
    }, (movies){
      emit(SearchSuccessState(movies: movies));
    });
  }
}
