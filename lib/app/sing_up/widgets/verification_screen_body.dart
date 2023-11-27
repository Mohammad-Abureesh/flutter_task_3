import 'package:flutter/material.dart';
import 'package:flutter_task_3/app/login/widgets/registration_header.dart';
import 'package:flutter_task_3/app/sing_up/controllers/verification_screen_controller.dart';
import 'package:flutter_task_3/core/presentation/widgets/ask_user_to.dart';
import 'package:flutter_task_3/core/presentation/widgets/submit_button.dart';

import 'otp_field.dart';

class VerificationScreenBody extends StatelessWidget {
  VerificationScreenBody({Key? key})
      : _controller = VerificationScreenController(),
        super(key: key);

  final VerificationScreenController _controller;
  @override
  Widget build(BuildContext context) {
    const gap = SizedBox(height: 45.0);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          gap,
          const RegistrationHeader.forResendVerification(),
          gap,
          OtpField(onComplete: _controller.onComplete),
          const AskUserTo.resendVerification(),
          const Spacer(),
          SubmitButton(
              title: 'Verify',
              onPressed: () {
                Navigator.pop(context, _controller.onVerify());
              }),
          gap,
        ],
      ),
    );
  }
}
