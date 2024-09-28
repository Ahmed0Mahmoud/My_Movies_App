import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/utils/appRouter.dart';
import 'package:movies_app/core/utils/styles.dart';
import 'package:movies_app/features/authentication/presentation/views/widgets/login_widgets/custom_red_button.dart';
import 'package:movies_app/features/authentication/presentation/views/widgets/otp_widgets/build_verifyCode_field.dart';

class OtpVerificationBody extends StatelessWidget {
  const OtpVerificationBody({super.key});

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
              "OTP Verification",
              style: Styles.textStyle28,
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "6 digit code has sent to xyz@gmail.com ",
              style: Styles.textStyle17.copyWith(color: Colors.grey),
            ),
          ),
          const SizedBox(height: 60),
          const Padding(
            padding:  EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BuildVfCodeField(),
                BuildVfCodeField(),
                BuildVfCodeField(),
                BuildVfCodeField(),
                BuildVfCodeField(),
                BuildVfCodeField(),
              ],
            ),
          ),
          const SizedBox(height: 25),
          CustomRedButton(
            title: 'Verify',
            onPressed: () {
              GoRouter.of(context).push(Approuter.resetPasswordViewRoute);
            },
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Didn't receive the Otp?",
                style: Styles.textStyle14.copyWith(color: Colors.grey),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Resend",
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
