import 'package:flutter/material.dart';
import 'package:movies_app/features/authentication/presentation/views/widgets/otp_widgets/otp_view_body.dart';

class OtpVerificationView extends StatelessWidget {
  const OtpVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OtpVerificationBody(),
    );
  }
}
