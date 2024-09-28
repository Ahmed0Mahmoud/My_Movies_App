import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/error_message.dart';
import 'package:movies_app/core/utils/styles.dart';
import 'package:movies_app/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:movies_app/features/search/presentation/manager/search_cubit/search_state.dart';
import 'package:movies_app/features/search/presentation/views/widgets/search_item.dart';

class Search_ListView extends StatelessWidget {
  final String query;
  const Search_ListView({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchStates>(
      builder: (context, state) {
        if (state is SearchSuccessState) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: SearchItem(movieModel: state.movies[index], query: query),
              );
            },
            itemCount: state.movies.length,
            padding: EdgeInsets.zero,
            shrinkWrap: true,
          );
        } else if (state is SearchErrorState) {
          return Center(child: CustomErrorMessage(errMessage: state.errorMessage));
        } else if (state is SearchLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return const Center(child: Text('Start searching 😇',style: Styles.textStyle14,));
        }
      },
    );
  }
}
