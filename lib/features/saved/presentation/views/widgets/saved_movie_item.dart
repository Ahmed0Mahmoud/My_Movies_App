import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/styles.dart';
import 'package:movies_app/features/home/data/model/movie_model.dart';
import 'package:movies_app/features/home/presentation/views/widgets/movie_details_widgets/movie_details_view_body.dart';
import 'package:movies_app/features/saved/presentation/views/widgets/saved_view_body.dart';

class SavedMovieItem extends StatefulWidget {
  final MovieModel movieModel;
  final VoidCallback onDelete; // Callback to notify the parent

  const SavedMovieItem({
    super.key,
    required this.movieModel,
    required this.onDelete,
  });

  @override
  State<SavedMovieItem> createState() => _SavedMovieitemState();
}

class _SavedMovieitemState extends State<SavedMovieItem> {
  void _deleteFavoriteItem() {
    setState(() {
      favoriteMovies.remove(widget.movieModel);
    });
    widget.onDelete();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: const Color(0xff1f1d35),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.all(12),
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(image: NetworkImage('http://image.tmdb.org/t/p/w200/${widget.movieModel.posterPath}'),
              fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '${widget.movieModel.title}',
                    style: Styles.textStyle16,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                //  SizedBox(height: 5),
                  Text(
                    '${widget.movieModel.releaseDate}',
                    style: Styles.textStyle14.copyWith(color: Colors.grey),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),
                  Container(
                    alignment: Alignment.center,
                    width: 130,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(17),
                    ),
                    child: const Text('Watch Now', style: Styles.textStyle18),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: IconButton(
              onPressed: () {
                _deleteFavoriteItem();
              },
              icon: const Icon(
                Icons.delete_forever,
                size: 35,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
