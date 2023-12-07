import 'package:flutter/material.dart';

import '/app/registration/login/widgets/registration_header.dart';
import '/core/presentation/widgets/app_logo.dart';
import 'sing_up_form.dart';

class SingUpScreenBody extends StatelessWidget {
  const SingUpScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50.0),
              const RegistrationHeader.forSingUp(),
              const AppLogo(),
              SingUpForm()
            ],
          ),
        ));
  }
}
