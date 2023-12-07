import 'package:flutter/material.dart';
import 'package:flutter_task_3/core/constants/images.dart';
import 'package:flutter_task_3/core/enums/e_app_pages.dart';
import 'package:flutter_task_3/core/utils/pages_manager.dart';
import 'package:flutter_task_3/core/utils/routing.dart';
import 'package:flutter_task_3/core/utils/session.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      EAppPages page;
      if (Session.isLogged) {
        Session.initFromStorage();
        page = EAppPages.mainScreen;
      } else {
        page = EAppPages.login;
      }

      Routing.replace(context, PagesManager.routeBuilder(page).call());
    });

    return Image.asset(
      Images.splash.path,
      fit: BoxFit.cover,
    );
  }
}
