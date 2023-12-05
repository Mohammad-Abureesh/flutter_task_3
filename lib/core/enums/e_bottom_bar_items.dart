import 'package:flutter/material.dart';

import '/app/categories/screens/categories_dashboard.dart';
import '/app/dashboard/screens/dashboard_screen.dart';
import '/app/explore/screens/search_dashboard.dart';
import '/app/favorites/screens/favorites_dashboard.dart';
import '/app/profile/screens/user_profile_dashboard.dart';
import '/core/extensions/string_ext.dart';

///Bottom navigation bar elements
enum BottomBarItems {
  home(Icons.storefront_sharp),
  categories(Icons.dashboard),
  search(Icons.search),
  favorites(Icons.favorite),
  profile(Icons.account_circle_outlined);

  const BottomBarItems(this.icon);

  final IconData icon;

  String get label => name.toUpperFirstChar;

  Widget Function() get routeBuilder {
    return switch (this) {
      home => () => const DashboardScreen(),
      categories => () => const CategoriesDashboard(),
      profile => () => const UserProfileDashboard(),
      search => () => const SearchDashboard(),
      favorites => () => const FavoritesDashboard()
    };
  }

  factory BottomBarItems.fromIndex(int index) {
    return values.firstWhere((element) => element.index == index);
  }
}
