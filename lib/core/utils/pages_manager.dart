import 'package:flutter/widgets.dart';
import 'package:flutter_task_3/app/categories/screens/categories_dashboard.dart';
import 'package:flutter_task_3/app/dashboard/screens/dashboard_screen.dart';
import 'package:flutter_task_3/app/dashboard/screens/main_screen_container.dart';
import 'package:flutter_task_3/app/explore/screens/search_dashboard.dart';
import 'package:flutter_task_3/app/favorites/screens/favorites_dashboard.dart';
import 'package:flutter_task_3/app/login/screens/login_screen.dart';
import 'package:flutter_task_3/app/profile/screens/user_profile_dashboard.dart';
import 'package:flutter_task_3/core/enums/e_app_pages.dart';

typedef PageBuilder = Widget Function();

class PagesManager {
  static final PagesManager _manager = PagesManager._internalManager();
  PagesManager._internalManager();

  PageBuilder _pages(EAppPages page) {
    final PageBuilder builder = switch (page) {
      EAppPages.login => () => const LoginScreen(),
      EAppPages.mainScreen => () => const MainScreenContainer(),
      EAppPages.home => () => const DashboardScreen(),
      EAppPages.categories => () => const CategoriesDashboard(),
      EAppPages.profile => () => const UserProfileDashboard(),
      EAppPages.search => () => const SearchDashboard(),
      EAppPages.favorites => () => const FavoritesDashboard()
    };

    return builder;
  }

  static PageBuilder routeBuilder(EAppPages page) {
    return _manager._pages(page);
  }
}