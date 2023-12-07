import 'package:flutter/material.dart';

import '/core/enums/e_app_pages.dart';
import '/core/extensions/string_ext.dart';
import '/core/utils/pages_manager.dart';

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
    final page = switch (this) {
      home => EAppPages.home,
      categories => EAppPages.categories,
      profile => EAppPages.profile,
      search => EAppPages.search,
      favorites => EAppPages.favorites
    };

    return PagesManager.routeBuilder(page);
  }

  factory BottomBarItems.fromIndex(int index) {
    return values.firstWhere((element) => element.index == index);
  }
}
