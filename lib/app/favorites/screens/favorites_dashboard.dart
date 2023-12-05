import 'package:flutter/material.dart';
import 'package:flutter_task_3/app/favorites/controllers/favorites_screen_controller.dart';
import 'package:flutter_task_3/app/favorites/widgets/favorites_dashboard_app_bar.dart';
import 'package:flutter_task_3/app/favorites/widgets/favorites_screen_body.dart';

class FavoritesDashboard extends StatelessWidget {
  const FavoritesDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FavoritesScreenController controller = FavoritesScreenController();
    return Scaffold(
        appBar: FavoritesDashboardAppBar(onSearch: controller.search),
        body: FavoritesScreenBody(controller: controller));
  }
}
