import 'package:flutter/material.dart';

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
}
