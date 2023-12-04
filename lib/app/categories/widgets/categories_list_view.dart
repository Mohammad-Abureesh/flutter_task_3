import 'package:flutter/material.dart';
import 'package:flutter_task_3/app/categories/controllers/categories_screen_controller.dart';
import 'package:flutter_task_3/core/presentation/widgets/empty_list_view.dart';

import 'category_card.dart';

const double _spacing = 10.0;

const double _aspectRatio = 16.0 / 9.0;

class CategoriesGridView extends StatefulWidget {
  final CategoriesScreenController controller;
  const CategoriesGridView({Key? key, required this.controller})
      : super(key: key);

  @override
  State<CategoriesGridView> createState() => _CategoriesGridViewState();
}

class _CategoriesGridViewState extends State<CategoriesGridView> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.controller.categories.isEmpty) {
      return const EmptyListView();
    }

    return GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: _spacing,
        mainAxisSpacing: _spacing,
        childAspectRatio: _aspectRatio,
        children:
            widget.controller.categories.map(CategoryCard.details).toList());
  }
}
