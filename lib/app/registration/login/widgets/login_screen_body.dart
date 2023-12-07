import 'package:flutter/material.dart';
import 'package:flutter_task_3/core/presentation/widgets/app_logo.dart';

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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const RegistrationHeader.forLogin(),
              const AppLogo(),
              LoginForm(),
              const SizedBox(height: 25.0),
              const SocialLoginButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
