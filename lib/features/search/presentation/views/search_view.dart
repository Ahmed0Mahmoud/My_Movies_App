import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/service_locator.dart';
import 'package:movies_app/features/home/data/repos/home_repo_implementation.dart';
import 'package:movies_app/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:movies_app/features/search/presentation/views/widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(getIt.get<HomeRepoImpl>()),
      child: Scaffold(
        body: const SearchViewBody(), // Ensure SearchViewBody is wrapped with BlocProvider
      ),
    );
  }
}
