import 'package:flutter/material.dart';

import '/app/categories/controllers/categories_screen_controller.dart';
import '../../../core/presentation/widgets/loading_state.dart';
import 'categories_list_view.dart';

class CategoriesDashboardBody extends StatelessWidget {
  final CategoriesScreenController controller;

  const CategoriesDashboardBody({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureLoadingState(
        onInit: controller.init,
        builder: (_) => Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 20.0),
            child: CategoriesGridView(controller: controller)));
  }
}
