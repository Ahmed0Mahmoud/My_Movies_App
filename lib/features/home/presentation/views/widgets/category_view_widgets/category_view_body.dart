import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/utils/styles.dart';
import 'package:movies_app/features/home/presentation/views/widgets/category_view_widgets/category_movies_gridview.dart';

class CategoryViewBody extends StatelessWidget {
  final String query;
  const CategoryViewBody({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(onPressed: (){
                  GoRouter.of(context).pop();
                }, child: const Icon(Icons.arrow_back_ios_sharp),minWidth: 25,color: const Color(0xff1f1d35),shape: const CircleBorder(),),
                Text(
                  query,
                  style: Styles.textStyle28,
                ),
                const Text(
                  '',
                  style: Styles.textStyle28,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: CategoryMoviesGridview(category: query,),
          ),
        ],
      ),
    );
  }
}
