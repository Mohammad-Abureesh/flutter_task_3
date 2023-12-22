import 'package:flutter/material.dart';

import '/app/explore/controllers/search_screen_controller.dart';
import '/app/explore/widgets/search_dashboard_app_bar.dart';
import '../widgets/search_screen_body.dart';

class SearchDashboard extends StatelessWidget {
  const SearchDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SearchScreenController controller = SearchScreenController();
    return Scaffold(
        appBar: SearchDashboardAppBar(
            onSearch: controller.search,
            onFilter: () => controller.openFilter(context)),
        body: SearchScreenBody(controller: controller));
  }
}
