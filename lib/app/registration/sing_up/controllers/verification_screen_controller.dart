import 'package:flutter/cupertino.dart';
import 'package:flutter_task_3/core/utils/verification_code_generator.dart';

class VerificationScreenController {
  VerificationScreenController() : otpController = TextEditingController();

  TextEditingController otpController;

  bool onVerify() {
    if (otpController.text.isEmpty) return false;
    return VerificationCodeGenerator().isVerified(otpController.text);
  }

  void onComplete(String value) {
    otpController.text += value;
  }
}
