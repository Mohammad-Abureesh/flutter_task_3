import 'package:flutter/material.dart';

///Bottom navigation bar elements
final Set<IconData> _items = {
  Icons.storefront_sharp,
  Icons.dashboard,
  Icons.search,
  Icons.favorite,
  Icons.account_circle_outlined
};

class DashboardBottomNavigationBar extends StatelessWidget {
  const DashboardBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        items: _items
            .map((icon) => BottomNavigationBarItem(label: '', icon: Icon(icon)))
            .toList());
  }
}
