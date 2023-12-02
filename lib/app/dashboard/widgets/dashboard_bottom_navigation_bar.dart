import 'package:flutter/material.dart';
import 'package:flutter_task_3/core/enums/e_bottom_bar_items.dart';

int launchScreenIndex = BottomBarItems.home.index;

class DashboardBottomNavigationBar extends StatefulWidget {
  final ValueChanged<int> onSelect;
  const DashboardBottomNavigationBar({Key? key, required this.onSelect})
      : super(key: key);

  @override
  State<DashboardBottomNavigationBar> createState() =>
      _DashboardBottomNavigationBarState();
}

class _DashboardBottomNavigationBarState
    extends State<DashboardBottomNavigationBar> {
  int currentIndex = launchScreenIndex;

  void _onSelectItem(int index) {
    widget.onSelect.call(index);
    currentIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) => BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: _onSelectItem,
      items: BottomBarItems.values
          .map((item) =>
              BottomNavigationBarItem(label: item.label, icon: Icon(item.icon)))
          .toList());
}
