import 'package:flutter/material.dart';
import 'package:flutter_task_3/app/dashboard/widgets/dashboard_app_bar.dart';
import 'package:flutter_task_3/app/dashboard/widgets/dashboard_bottom_navigation_bar.dart';
import 'package:flutter_task_3/app/dashboard/widgets/dashboard_screen_body.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: DashboardAppBar(),
        body: DashboardScreenBody(),
        bottomNavigationBar: DashboardBottomNavigationBar());
  }
}
