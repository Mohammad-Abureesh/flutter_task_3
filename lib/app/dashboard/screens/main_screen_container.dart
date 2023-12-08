import 'package:flutter/material.dart';
import 'package:flutter_task_3/app/dashboard/widgets/dashboard_bottom_navigation_bar.dart';
import 'package:flutter_task_3/core/enums/e_bottom_bar_items.dart';

class MainScreenContainer extends StatefulWidget {
  const MainScreenContainer({Key? key}) : super(key: key);

  @override
  State<MainScreenContainer> createState() => _MainScreenContainerState();
}

class _MainScreenContainerState extends State<MainScreenContainer> {
  BottomBarItems current = BottomBarItems.fromIndex(launchScreenIndex);

  void onSelect(int index) {
    current = BottomBarItems.fromIndex(index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnimatedSwitcher(
            duration: const Duration(milliseconds: 850),
            child: current.routeBuilder.call()),
        bottomNavigationBar: DashboardBottomNavigationBar(onSelect: onSelect));
  }
}
