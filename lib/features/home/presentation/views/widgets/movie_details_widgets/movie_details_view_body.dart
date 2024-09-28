
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/utils/styles.dart';
import 'package:movies_app/features/home/data/model/movie_model.dart';
import 'package:movies_app/features/home/presentation/views/widgets/movie_details_widgets/build_tab_sections.dart';
import 'package:movies_app/features/saved/presentation/views/widgets/saved_view_body.dart';
import 'package:rive_animated_icon/rive_animated_icon.dart';
class MovieDetailsViewBody extends StatefulWidget {
  final MovieModel movieModel;
  const MovieDetailsViewBody(this.movieModel,{super.key,});

  @override
  State<MovieDetailsViewBody> createState() => _MovieDetailsViewBodyState();
}

class _MovieDetailsViewBodyState extends State<MovieDetailsViewBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.topCenter,
            height: 370,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'http://image.tmdb.org/t/p/w200/${widget.movieModel.posterPath??""}',
                ),
                fit: BoxFit.fill,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(onPressed: (){
                    GoRouter.of(context).pop();
                  },color: const Color(0xff1f1d35),shape: const CircleBorder(),child: const Icon(Icons.arrow_back_ios_sharp),),

                  MaterialButton(
                    onPressed: () {},
                    shape: const CircleBorder(),color: const Color(0xff1f1d35),
                    child: RiveAnimatedIcon(
                        riveIcon: RiveIcon.star,
                        width: 35,
                        height: 35,
                        color: Colors.yellow,
                        strokeWidth: 3,
                        loopAnimation: false,
                        onTap: (){
                          favoriteMovies.add(widget.movieModel);
                        },
                        onHover: (value){}
                    ),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Text(
              '${widget.movieModel.title}',
              style: Styles.textStyle28.copyWith(backgroundColor: Colors.black38),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '${widget.movieModel.originalLanguage} |  ${widget.movieModel.releaseDate} |  popularty : ${widget.movieModel.popularity}',
                  style: Styles.textStyle16.copyWith(color: Colors.grey),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.play_arrow),
                      label: const Text('Play'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        padding:
                            const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.download),
                      label: const Text('Download'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[850],
                        padding:
                            const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  '${widget.movieModel.overview}',
                  style: Styles.textStyle16.copyWith(color: Colors.grey),maxLines: 5,overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 16),
                const Divider(color: Colors.grey),
                const BuildTabSections(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
