import 'package:flutter/material.dart';

import '/app/registration/login/widgets/login_screen_body.dart';
import '/core/presentation/widgets/ask_user_to.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: const LoginScreenBody(),
        bottomSheet: AskUserTo.signUp(),
      );
}
