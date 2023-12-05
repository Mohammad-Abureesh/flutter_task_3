import 'package:flutter/material.dart';
import 'package:flutter_task_3/app/explore/widgets/short_products_info_list_view.dart';
import 'package:flutter_task_3/app/favorites/controllers/favorites_screen_controller.dart';
import 'package:flutter_task_3/core/presentation/widgets/loading_state.dart';

class FavoritesScreenBody extends StatelessWidget {
  const FavoritesScreenBody({Key? key, required this.controller})
      : super(key: key);

  final FavoritesScreenController controller;

  @override
  Widget build(BuildContext context) {
    return FutureLoadingState(
        onInit: controller.init,
        builder: (_) => _FavoritesProductsListState(controller));
  }
}

class _FavoritesProductsListState extends StatefulWidget {
  const _FavoritesProductsListState(this.controller);

  final FavoritesScreenController controller;
  @override
  State<_FavoritesProductsListState> createState() =>
      _FavoritesProductsListStateState();
}

class _FavoritesProductsListStateState
    extends State<_FavoritesProductsListState> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    const double padding = 20.0;
    return ShortProductsInfoListView(
        padding: const EdgeInsets.only(
          top: padding * 2,
          left: padding,
          right: padding,
        ),
        products: widget.controller.favorites);
  }
}
