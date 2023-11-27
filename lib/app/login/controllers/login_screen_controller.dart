import 'package:flutter/material.dart';
import 'package:flutter_task_3/core/domain/entities/user.dart';
import 'package:flutter_task_3/core/domain/repositories/users_repository.dart';

import 'register_form_controller.dart';

class LoginScreenController extends RegisterFormController {
  bool rememberMe;

  LoginScreenController() : rememberMe = false;

  void onRememberChanged(bool? value) {
    rememberMe = value ?? false;
  }

  void onForgetPassword() {}

  @override
  void onSubmit([BuildContext? context]) async {
    if (!isValidForm) return;
    final repo = UsersRepository();
    User? user = await repo.login(
      emailController.text,
      passwordController.text,
    );
    if (user == null) return;
    //todo:complete success login
  }
}
