import 'package:flutter/material.dart';
import 'package:movies_app/features/authentication/presentation/views/widgets/forgetPassword_widgets/forget_password_body.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ForgetPasswordBody(),
    );
  }
}
