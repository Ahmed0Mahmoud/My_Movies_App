import 'package:flutter/material.dart';
import 'package:movies_app/features/authentication/presentation/views/widgets/signup_widgets/signup_view_body.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SignupViewBody(),
    );
  }
}
