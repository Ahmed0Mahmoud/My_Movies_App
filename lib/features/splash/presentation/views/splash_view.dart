import 'package:flutter/material.dart';
import 'package:movies_app/features/splash/presentation/views/widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SplashViewBody(),
      backgroundColor: Colors.red[800],
    );
  }
}
