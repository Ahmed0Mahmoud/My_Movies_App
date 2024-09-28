import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/service_locator.dart';
import 'package:movies_app/features/home/data/repos/home_repo_implementation.dart';
import 'package:movies_app/features/home/presentation/manager/categorys_cubit/categorys_cubit.dart';
import 'package:movies_app/features/home/presentation/views/widgets/category_view_widgets/category_view_body.dart';

class CategoryView extends StatelessWidget {
  final String query;

  const CategoryView({super.key, required this.query,});

  @override
  Widget build(BuildContext context) {
    return
      BlocProvider(create: (context)=>CategorysCubit(getIt.get<HomeRepoImpl>())..getCategorysMovies(query: query),
      child: Scaffold(
        body: CategoryViewBody(query: query,),
      ),
    );
  }
}
