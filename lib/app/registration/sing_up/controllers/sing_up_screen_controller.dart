import 'package:flutter/material.dart';

import '/app/registration/login/controllers/register_form_controller.dart';
import '/app/registration/sing_up/screens/verification_screen.dart';
import '/core/domain/entities/user.dart';
import '/core/domain/repositories/users_repository.dart';
import '/core/utils/verification_code_generator.dart';

List<User> users = [];

class SingUpScreenController extends RegisterFormController {
  SingUpScreenController() : nameController = TextEditingController();

  TextEditingController nameController;

  Future<bool> _openVerificationScreen(BuildContext context) async {
    VerificationCodeGenerator().generate();
    return await Navigator.push<bool?>(context,
            MaterialPageRoute(builder: (_) => const VerificationScreen())) ??
        false;
  }

  @override
  void onSubmit([BuildContext? context]) async {
    if (!isValidForm) return;
    if (!(context?.mounted ?? false)) return;

    final user = User.create(
        username: nameController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text.trim());

    final repo = UsersRepository();
    if (repo.isExist(user)) return;

    bool verified = await _openVerificationScreen(context!);
    if (!verified) return;

    await repo.create(user);
    if (context.mounted) Navigator.pop(context);
  }
}
