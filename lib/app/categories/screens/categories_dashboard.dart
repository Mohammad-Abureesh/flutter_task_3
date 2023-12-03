import 'package:flutter/material.dart';
import 'package:flutter_task_3/app/categories/controllers/categories_screen_controller.dart';

import '/app/categories/widgets/categories_dashboard_app_bar.dart';
import '/app/categories/widgets/categories_dashboard_body.dart';

class CategoriesDashboard extends StatelessWidget {
  const CategoriesDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final CategoriesScreenController controller = CategoriesScreenController();
    return Scaffold(
        appBar: CategoriesDashboardAppBar(onSearch: controller.search),
        body: CategoriesDashboardBody(controller: controller));
  }
}
