import 'package:flutter/material.dart';

import '/app/categories/widgets/categories_dashboard_app_bar.dart';
import '/app/categories/widgets/categories_dashboard_body.dart';

class CategoriesDashboard extends StatelessWidget {
  const CategoriesDashboard({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: const CategoriesDashboardAppBar(),
      body: CategoriesDashboardBody());
}
