import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/utils/service_locator.dart';
import 'package:movies_app/features/authentication/presentation/views/forget_password_view.dart';
import 'package:movies_app/features/authentication/presentation/views/login_view.dart';
import 'package:movies_app/features/authentication/presentation/views/otp_verification_view.dart';
import 'package:movies_app/features/authentication/presentation/views/reset_password_view.dart';
import 'package:movies_app/features/authentication/presentation/views/signup_view.dart';
import 'package:movies_app/features/home/data/model/movie_model.dart';
import 'package:movies_app/features/home/data/repos/home_repo_implementation.dart';
import 'package:movies_app/features/home/presentation/manager/categorys_cubit/categorys_cubit.dart';
import 'package:movies_app/features/home/presentation/manager/similar_movies_cubit/similar_movies_cubit.dart';
import 'package:movies_app/features/home/presentation/views/category_view.dart';
import 'package:movies_app/features/home/presentation/views/home_view.dart';
import 'package:movies_app/features/home/presentation/views/movie_details_view.dart';
import 'package:movies_app/features/saved/presentation/views/saved_view.dart';
import 'package:movies_app/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:movies_app/features/search/presentation/views/search_view.dart';
import 'package:movies_app/features/splash/presentation/views/splash_view.dart';

abstract class Approuter {
  static const splashViewRoute = '/';
  static const loginViewRoute = '/loginView';
  static const signupViewRoute = '/signupView';
  static const forgetPasswordViewRoute = '/forgetPasswordView';
  static const otpVerificationViewRoute = '/otpVerificationView';
  static const resetPasswordViewRoute = '/resetPasswordView';
  static const homeViewRoute = '/homeView';
  static const movieDetailsViewRoute = '/movieDetailsView';
  static const categoryViewRoute = '/categoryView';
  static const savedViewRoute = '/savedView';
  static const searchViewRoute = '/searchView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: splashViewRoute,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: loginViewRoute,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: signupViewRoute,
        builder: (context, state) => const SignupView(),
      ),
      GoRoute(
        path: forgetPasswordViewRoute,
        builder: (context, state) => const ForgetPasswordView(),
      ),
      GoRoute(
        path: otpVerificationViewRoute,
        builder: (context, state) => const OtpVerificationView(),
      ),
      GoRoute(
        path: resetPasswordViewRoute,
        builder: (context, state) => const ResetPasswordView(),
      ),
      GoRoute(
        path: homeViewRoute,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: movieDetailsViewRoute,
        builder: (context, state) {
          final movieModel = state.extra as MovieModel;
          return BlocProvider(
            create: (context) => SimilarMoviesCubit(getIt.get<HomeRepoImpl>()),
            child: MovieDetailsView(movieModel: movieModel,),
          );
        },
      ),
      GoRoute(
          path: categoryViewRoute,
          builder: (context, state) {
            final query = state.extra as String;
            return BlocProvider(
              create: (context) =>
                  CategorysCubit(getIt.get<HomeRepoImpl>()),
              child: CategoryView(query: '$query',),
            );
          }),
      GoRoute(
          path: savedViewRoute,
          builder: (context, state) {
            // final movieModel = state.extra as MovieModel;
            return SavedView();
          }),
      GoRoute(
          path: searchViewRoute,
          builder: (context, state) {
            return BlocProvider(
              create: (context) => SearchCubit(getIt.get<HomeRepoImpl>()),
              child: SearchView(),
            );
          }),
    ],
  );
}
