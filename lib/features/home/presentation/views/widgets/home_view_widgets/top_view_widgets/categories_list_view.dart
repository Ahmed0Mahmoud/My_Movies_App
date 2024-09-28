import 'package:flutter/material.dart';
import 'package:movies_app/features/home/presentation/views/widgets/home_view_widgets/top_view_widgets/custom_category_button.dart';

class CategoriesListview extends StatelessWidget {
  const CategoriesListview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        children: const [
          CustomCategoryButton(title: 'Action'),
          SizedBox(
            width: 5,
          ),
          CustomCategoryButton(title: 'Adventure'),
          SizedBox(
            width: 5,
          ),
          CustomCategoryButton(title: 'Animation'),
          SizedBox(
            width: 5,
          ),
          CustomCategoryButton(title: 'gangster'),
          SizedBox(
            width: 5,
          ),
          CustomCategoryButton(title: 'Crime'),
          SizedBox(
            width: 5,
          ),
          CustomCategoryButton(title: 'Historical'),
          SizedBox(
            width: 5,
          ),
        ],
      ),
    );
  }
}
