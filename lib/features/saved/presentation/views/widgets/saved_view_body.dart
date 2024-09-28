import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/styles.dart';
import 'package:movies_app/features/saved/presentation/views/widgets/saved_items_listview.dart';
import 'package:movies_app/features/home/data/model/movie_model.dart';

List<MovieModel> favoriteMovies = [];

class SavedViewBody extends StatefulWidget {
  const SavedViewBody({super.key});

  @override
  State<SavedViewBody> createState() => _SavedViewBodyState();
}

class _SavedViewBodyState extends State<SavedViewBody> {

  void _updateFavorites() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Saved', style: Styles.textStyle28),
            ],
          ),
          Expanded(
            child: SavedItemsListview(
              onDelete: _updateFavorites,
            ),
          ),
        ],
      ),
    );
  }
}
