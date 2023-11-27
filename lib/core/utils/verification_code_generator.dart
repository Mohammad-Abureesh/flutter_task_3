import 'dart:math';

import 'package:flutter/cupertino.dart';

class VerificationCodeGenerator {
  static final Set<int> _codes = {};

  void generate() {
    final rnd = Random();
    num next = rnd.nextDouble() * 9999;

    while (next < 4) {
      next *= 10;
    }

    if (_codes.contains(next.toInt())) {
      generate();
      return;
    }

    debugPrint('Generated OTP [${next.toInt()}]');
    _codes.add(next.toInt());
  }

  bool isVerified(String otp) {
    bool r = _codes.last == int.tryParse(otp);
    _codes.clear();
    return r;
  }
}
