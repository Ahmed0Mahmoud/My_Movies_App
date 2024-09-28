
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/home/data/repos/home_repo.dart';
import 'package:movies_app/features/home/presentation/manager/categorys_cubit/categorys_state.dart';

class CategorysCubit extends Cubit<CategorysStates> {
  final HomeRepo homeRepo;
  CategorysCubit(this.homeRepo) : super(CategorysInitialState());

  Future<void> getCategorysMovies({required String query})async{
    emit(CategorysLoadingState());
    var result = await homeRepo.fetchCategoryMovies(query: query);
    result.fold((failure){
      emit(CategorysErrorState(errorMessage: failure.errorMessage));
    }, (movies){
      emit(CategorysSuccessState(movies: movies));
    });
  }
}
