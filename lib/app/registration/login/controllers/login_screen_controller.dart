import 'package:flutter/material.dart';
import 'package:flutter_task_3/core/domain/entities/user.dart';
import 'package:flutter_task_3/core/domain/repositories/users_repository.dart';
import 'package:flutter_task_3/core/enums/e_app_pages.dart';
import 'package:flutter_task_3/core/utils/routing.dart';
import 'package:flutter_task_3/core/utils/session.dart';

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
    if (context == null) return;

    final repo = UsersRepository();
    User? user = await repo.login(
      emailController.text,
      passwordController.text,
    );

    if (user == null) return;
    if (context.mounted) _toDashboard(context, user);
  }

  ///On success login init current session then open main screen
  void _toDashboard(BuildContext context, User user) {
    Session.initSession(user, rememberMe);
    Routing.replaceFromAppPage(context, EAppPages.mainScreen);
  }
}
