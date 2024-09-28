import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/error_message.dart';
import 'package:movies_app/features/home/presentation/manager/posters_cubit/posters_cubit.dart';
import 'package:movies_app/features/home/presentation/manager/posters_cubit/posters_state.dart';
import 'package:carousel_slider/carousel_slider.dart';
class PostersListview extends StatelessWidget {
  const PostersListview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostersCubit, PostersStates>(
      builder: (context, state){
        if(state is PostersSuccessState){
          return CarouselSlider(
              options: CarouselOptions(
                height: 300,
                viewportFraction: 1.2,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 600),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              ) ,
             items: state.movies.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.amber,
                        image: DecorationImage(image: NetworkImage('http://image.tmdb.org/t/p/w200/${i.posterPath}'),
                        fit: BoxFit.fill,
                        ),
                      ),
                  );
                },
              );
            }).toList(),
          );

        }
        else if(state is PostersErrorState){
          return Center(child: CustomErrorMessage(errMessage: state.errorMessage));
        }

        else {
          return const Center(child: CircularProgressIndicator(color: Colors.red,));
        }

      },
    );
  }
}
