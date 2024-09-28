import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/utils/appRouter.dart';
import 'package:movies_app/core/utils/styles.dart';
import 'package:movies_app/features/authentication/presentation/views/widgets/login_widgets/custom_red_button.dart';
import 'package:movies_app/features/authentication/presentation/views/widgets/login_widgets/custom_text_field.dart';
import 'package:movies_app/features/authentication/presentation/views/widgets/login_widgets/google,facebook_auth.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           const Text(
            "Login",
            style: Styles.textStyle28,
          ),
          const SizedBox(height: 20),
          const CustomTextField(
            hintText: 'Email Address',
          ),
          const SizedBox(height: 15),
          const CustomTextField(hintText: 'Password'),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                GoRouter.of(context).push(Approuter.forgetPasswordViewRoute);
              },
              child: const Text(
                "Forgot Password?",
                style: Styles.textStyle16,
              ),
            ),
          ),
          const SizedBox(height: 20),
          CustomRedButton(
            title: 'Login',
            onPressed: () {
              GoRouter.of(context).pushReplacement(Approuter.homeViewRoute);
            },
          ),
          const SizedBox(height: 20),
          Text(
            "or",
            style: Styles.textStyle14.copyWith(color: Colors.grey),
          ),
          const SizedBox(height: 20),
          const GoogleFacebookAuth(),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Do you already have an account?",
                style: Styles.textStyle14.copyWith(color: Colors.grey),
              ),
              TextButton(
                onPressed: () {
                  GoRouter.of(context).push(Approuter.signupViewRoute);
                },
                child: const Text(
                  "Sign up now",
                  style: Styles.textStyle16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
