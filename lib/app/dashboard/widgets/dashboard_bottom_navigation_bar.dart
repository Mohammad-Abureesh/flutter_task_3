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
    final theme = Theme.of(context);
    return BottomNavigationBar(
        selectedItemColor: theme.primaryColor,
        unselectedItemColor: theme.hintColor,
        items: _items
            .map((icon) => BottomNavigationBarItem(label: '', icon: Icon(icon)))
            .toList());
  }
}
