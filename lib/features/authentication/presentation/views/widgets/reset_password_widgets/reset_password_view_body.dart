import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/styles.dart';
import 'package:movies_app/features/authentication/presentation/views/widgets/login_widgets/custom_red_button.dart';
import 'package:movies_app/features/authentication/presentation/views/widgets/login_widgets/custom_text_field.dart';
import 'package:movies_app/features/authentication/presentation/views/widgets/reset_password_widgets/show_dialog.dart';

class ResetPasswordViewBody extends StatelessWidget {
  const ResetPasswordViewBody({super.key});

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
              "Reset Password?",
              style: Styles.textStyle28,
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "please enter your new password to update the password",
              style: Styles.textStyle17.copyWith(color: Colors.grey),
            ),
          ),
          const SizedBox(height: 30),
          const CustomTextField(
            hintText: 'Password',
          ),
          const SizedBox(height: 15),
          const CustomTextField(hintText: 'Confirm new password'),
          const SizedBox(height: 30),
          CustomRedButton(
            title: 'Reset Password',
            onPressed: () {
              showSuccessDialog(context);
            },
          ),
        ],
      ),
    );
  }
}
