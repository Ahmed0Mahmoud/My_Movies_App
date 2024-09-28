import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/error_message.dart';
import 'package:movies_app/features/home/presentation/manager/similar_movies_cubit/similar_movies_cubit.dart';
import 'package:movies_app/features/home/presentation/manager/similar_movies_cubit/similar_movies_state.dart';
import 'package:movies_app/features/home/presentation/views/widgets/movie_details_widgets/similar_movie_card.dart';

class MoviesGridview extends StatelessWidget {
  const MoviesGridview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarMoviesCubit, SimilarMoviesStateStates>(
      builder: (context, state) {
        if(state is SimilarMoviesSuccessState){
          return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  mainAxisExtent: 150),
              itemCount: 15,
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return SimilarMovieCard(movieModel: state.movies[index]);
              });
        }
        else if (state is SimilarMoviesErrorState){
          return Center(child: CustomErrorMessage(errMessage: state.errorMessage));
        }
        else{
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
