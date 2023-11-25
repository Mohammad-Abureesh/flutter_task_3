import 'package:flutter/material.dart';
import 'package:flutter_task_3/core/constants/images.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center, child: Image.asset(Images.logo.path));
  }
}
