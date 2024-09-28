import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/error_message.dart';
import 'package:movies_app/features/home/presentation/manager/categorys_cubit/categorys_cubit.dart';
import 'package:movies_app/features/home/presentation/manager/categorys_cubit/categorys_state.dart';
import 'package:movies_app/features/home/presentation/views/widgets/movie_details_widgets/similar_movie_card.dart';

class CategoryMoviesGridview extends StatelessWidget {
  final String category;
  const CategoryMoviesGridview({
    super.key, required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategorysCubit, CategorysStates>(
      builder: (context, state) {
        if(state is CategorysSuccessState){
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
        else if (state is CategorysErrorState){
          return Center(child: CustomErrorMessage(errMessage: state.errorMessage));
        }
        else{
          return const Center(child: CircularProgressIndicator(color: Colors.red,));
        }
      },
    );
  }
}
