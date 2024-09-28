import 'package:flutter/material.dart';
import 'package:movies_app/features/home/data/model/movie_model.dart';

class PosterCard extends StatelessWidget {
  final MovieModel movieModel;
  const PosterCard({
    super.key, required this.movieModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      width: 400,
      decoration: BoxDecoration(
          image: DecorationImage(
        image: NetworkImage('http://image.tmdb.org/t/p/w200/${movieModel.posterPath}??""'),
        fit: BoxFit.fill,
      )),
    );
  }
}
