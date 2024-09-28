import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/appRouter.dart';
import 'package:movies_app/core/utils/service_locator.dart';
import 'package:movies_app/features/home/data/repos/home_repo_implementation.dart';
import 'package:movies_app/features/home/presentation/manager/latest_movies_cubit/latest_movies_cubit.dart';
import 'package:movies_app/features/home/presentation/manager/popular_movies_cubit/popular_movies_cubit.dart';
import 'package:movies_app/features/home/presentation/manager/posters_cubit/posters_cubit.dart';
import 'package:movies_app/features/search/presentation/manager/search_cubit/search_cubit.dart';

main() {
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>PostersCubit(getIt.get<HomeRepoImpl>())..getPosters()),
        BlocProvider(create: (context)=>PopularMoviesCubit(getIt.get<HomeRepoImpl>())..getPopularMovies()),
        BlocProvider(create: (context)=>LatestMoviesCubit(getIt.get<HomeRepoImpl>())..getLatestMovies()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: Approuter.router,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: const Color(0xff06041f),
        ),
      ),
    );
  }
}
