import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/utils/appRouter.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();

    // Delay for 7 seconds and then navigate
    Future.delayed(const Duration(seconds: 3), () {
      // Navigate after the widget is built
      GoRouter.of(context).pushReplacement(Approuter.loginViewRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          height: 100,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: IconButton(
              onPressed: () {
                // Handle play button action if needed
              },
              icon: const Icon(
                Icons.play_circle_outline,
                size: 60,
                color: Colors.pink,
              )),
        )
      ],
    );
  }
}
