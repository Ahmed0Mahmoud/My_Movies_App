import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/utils/appRouter.dart';
import 'package:movies_app/features/home/data/model/movie_model.dart';

class SimilarMovieCard extends StatelessWidget {
  final MovieModel movieModel;
  const SimilarMovieCard({
    super.key, required this.movieModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(Approuter.movieDetailsViewRoute,extra: movieModel);
      },
      child: Container(
        width: 100,
        height: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: NetworkImage('http://image.tmdb.org/t/p/w200/${movieModel.posterPath??"https://images.pexels.com/photos/4201333/pexels-photo-4201333.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"}'),
              fit: BoxFit.fill,
            )),
      ),
    );
  }
}
