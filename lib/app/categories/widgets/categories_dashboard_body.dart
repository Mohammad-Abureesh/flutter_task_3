import 'package:flutter/material.dart';

import '/app/categories/controllers/categories_screen_controller.dart';
import 'categories_list_view.dart';

class CategoriesDashboardBody extends StatelessWidget {
  final CategoriesScreenController _controller;

  CategoriesDashboardBody({Key? key})
      : _controller = CategoriesScreenController(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO:manage loading state
    return CategoriesListView(data: _controller.categories);
  }
}
