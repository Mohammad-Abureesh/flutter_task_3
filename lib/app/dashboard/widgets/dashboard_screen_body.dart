import 'package:flutter/material.dart';
import 'package:flutter_task_3/app/dashboard/controllers/dashboard_screen_controller.dart';
import 'package:flutter_task_3/core/enums/e_products_filter.dart';

import 'products_custom_view.dart';

class DashboardScreenBody extends StatefulWidget {
  const DashboardScreenBody({Key? key}) : super(key: key);

  @override
  State<DashboardScreenBody> createState() => _DashboardScreenBodyState();
}

class _DashboardScreenBodyState extends State<DashboardScreenBody> {
  _DashboardScreenBodyState()
      : loading = true,
        _controller = DashboardScreenController();

  final DashboardScreenController _controller;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    _controller.init().then((value) {
      _updateLoadingState = false;
    });
  }

  set _updateLoadingState(bool value) {
    if (!mounted) return;
    loading = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (loading) return const CircularProgressIndicator();

    return Padding(
        padding: const EdgeInsets.only(left: 8.0, top: 15.0),
        child: SingleChildScrollView(
            child: Column(
                children: ProductsFilter.values.map(_viewBuilder).toList())));
  }

  Widget _viewBuilder(ProductsFilter filter) {
    return ProductsCustomView(
        enableOtherStyle: filter == ProductsFilter.forYou,
        data: _controller.fromFilter(filter),
        filter: filter);
  }
}
