import 'package:flutter/material.dart';
import 'package:flutter_task_3/app/login/widgets/login_screen_body.dart';
import 'package:flutter_task_3/core/presentation/widgets/ask_user_to.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: const LoginScreenBody(),
        bottomSheet: AskUserTo.signUp(),
      );
}
