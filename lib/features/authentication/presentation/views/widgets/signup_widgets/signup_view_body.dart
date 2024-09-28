import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/utils/appRouter.dart';
import 'package:movies_app/core/utils/styles.dart';
import 'package:movies_app/features/authentication/presentation/views/widgets/login_widgets/custom_red_button.dart';
import 'package:movies_app/features/authentication/presentation/views/widgets/login_widgets/custom_text_field.dart';
import 'package:movies_app/features/authentication/presentation/views/widgets/login_widgets/google,facebook_auth.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Sign Up",
            style: Styles.textStyle28,
          ),
          const SizedBox(height: 20),
          const CustomTextField(
            hintText: 'Full Name',
          ),
          const SizedBox(height: 15),
          const CustomTextField(
            hintText: 'Email Address',
          ),
          const SizedBox(height: 15),
          const CustomTextField(hintText: 'Password'),
          const SizedBox(height: 10),
          const SizedBox(height: 20),
          CustomRedButton(
            title: 'Sign Up',
            onPressed: () {},
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
                  GoRouter.of(context).push(Approuter.loginViewRoute);
                },
                child: const Text(
                  "Log in now",
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
