import 'package:flutter/material.dart';
import 'package:movies_app/features/home/presentation/views/widgets/movie_details_widgets/movies_gridview.dart';

class SimilarTab extends StatelessWidget {

  const SimilarTab({super.key, });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:  EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Expanded(child: MoviesGridview()),
      ],
      ),
    );
  }
}
