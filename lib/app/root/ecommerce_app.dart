import 'package:flutter/material.dart';
import 'package:flutter_task_3/core/presentation/style/app_style.dart';

import 'splash_screen.dart';

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: LightTheme().theme,
        home: const SplashScreen());
  }
}
