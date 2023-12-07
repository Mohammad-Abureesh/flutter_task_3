import 'package:flutter/cupertino.dart';

abstract class RegisterFormController {
  RegisterFormController()
      : formKey = GlobalKey(),
        emailController = TextEditingController(),
        passwordController = TextEditingController();

  TextEditingController emailController;
  TextEditingController passwordController;

  GlobalKey<FormState> formKey;

  void onSubmit();

  bool get isValidForm => formKey.currentState?.validate() ?? false;
}
