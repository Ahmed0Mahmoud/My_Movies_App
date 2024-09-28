import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/styles.dart';
import 'package:movies_app/features/home/presentation/views/widgets/home_view_widgets/below_view_widgets/latest_movie_listview.dart';
import 'package:movies_app/features/home/presentation/views/widgets/home_view_widgets/below_view_widgets/popular_movies_listview.dart';
import 'package:movies_app/features/home/presentation/views/widgets/home_view_widgets/top_view_widgets/categories_list_view.dart';
import 'package:movies_app/features/home/presentation/views/widgets/home_view_widgets/top_view_widgets/poster_listview.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:  EdgeInsets.only(left: 16,right: 16,bottom: 16),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                PostersListview(),
                SizedBox(height: 10),
                CategoriesListview(),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Most Popular',
                      style: Styles.textStyle20,
                    ),
                    // Text(
                    //   'See all ',
                    //   style: Styles.textStyle16,
                    // ),
                  ],
                ),
                SizedBox(height: 10),
                PopularMoviesListview(),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Latest Movies',
                      style: Styles.textStyle20,
                    ),
                    // Text(
                    //   'See all ',
                    //   style: Styles.textStyle16,
                    // ),
                  ],
                ),
                SizedBox(height: 10),
                LatestMoviesListview(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
