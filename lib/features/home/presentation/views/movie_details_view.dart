import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/home/data/model/movie_model.dart';
import 'package:movies_app/features/home/presentation/manager/similar_movies_cubit/similar_movies_cubit.dart';
import 'package:movies_app/features/home/presentation/views/widgets/movie_details_widgets/movie_details_view_body.dart';

class MovieDetailsView extends StatefulWidget {
  final MovieModel movieModel;
  const MovieDetailsView({super.key, required this.movieModel});

  @override
  State<MovieDetailsView> createState() => _MovieDetailsViewState();
  
}

class _MovieDetailsViewState extends State<MovieDetailsView> {
  @override
  void initState() {
    BlocProvider.of<SimilarMoviesCubit>(context).getSimilarMovies(id: widget.movieModel.id!);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: MovieDetailsViewBody(widget.movieModel),
      ),
    );
  }
}
