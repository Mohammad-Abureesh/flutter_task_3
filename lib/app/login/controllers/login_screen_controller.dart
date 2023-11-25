import 'package:flutter/material.dart';

class LoginScreenController {
  TextEditingController emailController;
  TextEditingController passwordController;

  bool rememberMe = false;

  LoginScreenController()
      : emailController = TextEditingController(),
        passwordController = TextEditingController();

  void onLogin() {}

  void onRememberChanged(bool? value) {
    rememberMe = value ?? false;
  }

  void onForgetPassword() {}
}
