import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/utils/appRouter.dart';
import 'package:movies_app/core/utils/styles.dart';
import 'package:movies_app/features/authentication/presentation/views/widgets/login_widgets/custom_red_button.dart';
import 'package:movies_app/features/authentication/presentation/views/widgets/login_widgets/custom_text_field.dart';

class ForgetPasswordBody extends StatelessWidget {
  const ForgetPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Forgot Password?",
              style: Styles.textStyle28,
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "You forgot your password? don't worry,please enter your recovery email address",
              style: Styles.textStyle17.copyWith(color: Colors.grey),
            ),
          ),
          const SizedBox(height: 60),
          const CustomTextField(
            hintText: 'Email Address',
          ),
          const SizedBox(height: 25),
          CustomRedButton(
            title: 'Submit',
            onPressed: () {
              GoRouter.of(context).push(Approuter.otpVerificationViewRoute);
            },
          ),
        ],
      ),
    );
  }
}
