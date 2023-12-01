import 'package:flutter/material.dart';
import 'package:flutter_task_3/core/enums/e_bottom_bar_items.dart';

class DashboardBottomNavigationBar extends StatelessWidget {
  const DashboardBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BottomNavigationBar(
      items: BottomBarItems.values
          .map((item) =>
              BottomNavigationBarItem(label: item.label, icon: Icon(item.icon)))
          .toList());
}
