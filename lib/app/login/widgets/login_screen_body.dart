import 'package:flutter/material.dart';
import 'package:flutter_task_3/core/presentation/widgets/app_logo.dart';
import 'package:flutter_task_3/core/presentation/widgets/ask_user_to.dart';

import 'login_form.dart';
import 'registration_header.dart';
import 'social_login_buttons.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            const RegistrationHeader.forLogin(),
            const AppLogo(),
            LoginForm(),
            const SizedBox(height: 25.0),
            const SocialLoginButtons(),
            const Spacer(),
            const AskUserTo.signUp(),
          ],
        ),
      ),
    );
  }
}
