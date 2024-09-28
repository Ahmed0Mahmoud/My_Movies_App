
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/home/data/repos/home_repo.dart';
import 'package:movies_app/features/home/presentation/manager/posters_cubit/posters_state.dart';

class PostersCubit extends Cubit<PostersStates> {
  final HomeRepo homeRepo;
  PostersCubit(this.homeRepo) : super(PostersInitialState());

  Future<void> getPosters()async{
    emit(PostersLoadingState());
    var result = await homeRepo.fetchAllPosters();
    result.fold((failure){
      emit(PostersErrorState(errorMessage: failure.errorMessage));
    }, (movies){
      emit(PostersSuccessState(movies: movies));
    });
  }
}
