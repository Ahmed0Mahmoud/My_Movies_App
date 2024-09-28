import 'package:flutter/material.dart';
import 'package:movies_app/features/saved/presentation/views/widgets/saved_movie_item.dart';
import 'package:movies_app/features/saved/presentation/views/widgets/saved_view_body.dart';

class SavedItemsListview extends StatelessWidget {
  final VoidCallback onDelete;
  const SavedItemsListview({super.key, required this.onDelete});


  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              const SizedBox(height: 20),
              ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: SavedMovieItem(
                      movieModel: favoriteMovies[index],
                      onDelete: onDelete, // Pass the callback to delete an item
                    ),
                  );
                },
                itemCount: favoriteMovies.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
              ),
            ],
          ),
        )
      ],
    );
  }
}
