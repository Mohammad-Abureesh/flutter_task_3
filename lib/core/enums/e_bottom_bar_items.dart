import 'package:flutter/material.dart';
import 'package:flutter_task_3/app/categories/screens/categories_dashboard.dart';
import 'package:flutter_task_3/app/dashboard/screens/dashboard_screen.dart';

///Bottom navigation bar elements
enum BottomBarItems {
  home(Icons.storefront_sharp),
  categories(Icons.dashboard),
  search(Icons.search),
  favorites(Icons.favorite),
  profile(Icons.account_circle_outlined);

  const BottomBarItems(this.icon);

  final IconData icon;

  String get label {
    String first = name.characters.first;
    return name.replaceFirst(first, first.toUpperCase());
  }

  Widget Function() get routeBuilder {
    return switch (this) {
      home => () => const DashboardScreen(),
      categories => () => const CategoriesDashboard(),
      _ => () => const SizedBox.shrink()
    };
  }

  factory BottomBarItems.fromIndex(int index) {
    return values.firstWhere((element) => element.index == index);
  }
}
