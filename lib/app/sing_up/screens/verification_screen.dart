import 'package:flutter/material.dart';
import 'package:flutter_task_3/app/sing_up/widgets/default_app_bar.dart';
import 'package:flutter_task_3/app/sing_up/widgets/verification_screen_body.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: DefaultAppBar(), body: VerificationScreenBody());
  }
}
