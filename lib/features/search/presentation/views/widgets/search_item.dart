import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/utils/appRouter.dart';
import 'package:movies_app/core/utils/styles.dart';
import 'package:movies_app/features/home/data/model/movie_model.dart';

class SearchItem extends StatelessWidget {
  final MovieModel movieModel;
  final String query;

  const SearchItem({
    super.key,
    required this.movieModel, required this.query,
  });


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        GoRouter.of(context).push(Approuter.movieDetailsViewRoute,extra: movieModel);
      },
      child: Container(
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
                color: Colors.red,
                image: DecorationImage(image: NetworkImage('http://image.tmdb.org/t/p/w200/${movieModel.posterPath??"https://images.pexels.com/photos/4201333/pexels-photo-4201333.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"}'),
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
                     movieModel.title??"noTitle",
                      style: Styles.textStyle16,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                      SizedBox(height: 5),
                    Text(
                      '${movieModel.releaseDate}',
                      style: Styles.textStyle14.copyWith(color: Colors.grey),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    // Container(
                    //   alignment: Alignment.center,
                    //   width: 130,
                    //   height: 40,
                    //   decoration: BoxDecoration(
                    //     color: Colors.red,
                    //     borderRadius: BorderRadius.circular(17),
                    //   ),
                    //   child: const Text('Watch Now', style: Styles.textStyle18),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
