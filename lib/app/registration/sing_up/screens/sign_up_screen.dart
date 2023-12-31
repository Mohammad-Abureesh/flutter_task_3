import 'package:flutter/material.dart';
import 'package:flutter_task_3/core/presentation/widgets/ask_user_to.dart';

import '/app/registration/sing_up/widgets/default_app_bar.dart';
import '/app/registration/sing_up/widgets/sing_up_screen_body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: DefaultAppBar(),
        body: const SingUpScreenBody(),
        bottomSheet: AskUserTo.signIn(),
      );
}
