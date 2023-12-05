import 'package:flutter/material.dart';
import 'package:flutter_task_3/app/explore/widgets/short_products_info_list_view.dart';
import 'package:flutter_task_3/app/favorites/controllers/favorites_screen_controller.dart';

class FavoritesScreenBody extends StatelessWidget {
  const FavoritesScreenBody({Key? key, required this.controller})
      : super(key: key);

  final FavoritesScreenController controller;

  @override
  Widget build(BuildContext context) {
    return ShortProductsInfoListView(products: controller.favorites);
  }
}
