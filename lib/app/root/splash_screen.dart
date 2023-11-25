import 'package:flutter/material.dart';
import 'package:flutter_task_3/app/login/screens/login_screen.dart';
import 'package:flutter_task_3/core/constants/images.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const LoginScreen()));
    });

    return Image.asset(
      Images.splash.path,
      fit: BoxFit.cover,
    );
  }
}
