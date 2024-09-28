import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/utils/appRouter.dart';
import 'package:movies_app/core/utils/styles.dart';

class CustomCategoryButton extends StatelessWidget {
  final String title;
  const CustomCategoryButton({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          GoRouter.of(context).push(
            Approuter.categoryViewRoute,
            extra: title,
          );
        },
        child: Text(
          title,
          style: Styles.textStyle18,
        ));
  }
}
