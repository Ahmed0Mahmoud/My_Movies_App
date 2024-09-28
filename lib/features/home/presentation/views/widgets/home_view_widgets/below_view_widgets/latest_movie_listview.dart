import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/error_message.dart';
import 'package:movies_app/features/home/presentation/manager/latest_movies_cubit/latest_movies_cubit.dart';
import 'package:movies_app/features/home/presentation/manager/latest_movies_cubit/latest_movies_state.dart';
import 'package:movies_app/features/home/presentation/views/widgets/home_view_widgets/below_view_widgets/latest_movie_card.dart';

class LatestMoviesListview extends StatelessWidget {
  const LatestMoviesListview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LatestMoviesCubit, LatestMoviesStates>(
      builder: (context, state) {
        if(state is LatestMoviesSuccessState){
          return SizedBox(
            height: 150,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 22),
                  child: LatestMovieCard(movieModel: state.movies[index],),
                );
              },
              itemCount: state.movies.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
            ),
          );
        }
        else if(state is LatestMoviesErrorState){
          return CustomErrorMessage(errMessage: state.errorMessage);
        }
        else{
          return const Center(child: CircularProgressIndicator(color: Colors.red,));
        }
      },
    );
  }
}
