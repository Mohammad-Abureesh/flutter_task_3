import 'package:flutter/material.dart';
import 'package:flutter_task_3/core/presentation/widgets/loading_state.dart';

import '/app/dashboard/controllers/dashboard_screen_controller.dart';
import '/core/enums/e_products_filter.dart';
import 'products_custom_view.dart';

class DashboardScreenBody extends StatelessWidget {
  DashboardScreenBody({Key? key})
      : _controller = DashboardScreenController(),
        super(key: key);

  final DashboardScreenController _controller;
  @override
  Widget build(BuildContext context) {
    return FutureLoadingState(
      onInit: _controller.init,
      builder: (context) => Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 15.0),
          child: SingleChildScrollView(
              child: Column(
                  children: ProductsFilter.values.map(_viewBuilder).toList()))),
    );
  }

  Widget _viewBuilder(ProductsFilter filter) {
    return ProductsCustomView(
        enableOtherStyle: filter == ProductsFilter.forYou,
        data: _controller.fromFilter(filter),
        filter: filter);
  }
}
