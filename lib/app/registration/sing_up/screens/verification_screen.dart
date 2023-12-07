import 'package:flutter/material.dart';

import '/app/registration/sing_up/widgets/default_app_bar.dart';
import '/app/registration/sing_up/widgets/verification_screen_body.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: DefaultAppBar(), body: VerificationScreenBody());
  }
}
