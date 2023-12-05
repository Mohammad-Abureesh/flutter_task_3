import 'package:flutter/material.dart';
import 'package:flutter_task_3/app/explore/controllers/search_screen_controller.dart';

import 'short_products_info_list_view.dart';

class SearchScreenBody extends StatefulWidget {
  final SearchScreenController controller;

  const SearchScreenBody({Key? key, required this.controller})
      : super(key: key);

  @override
  State<SearchScreenBody> createState() => _SearchScreenBodyState();
}

class _SearchScreenBodyState extends State<SearchScreenBody> {
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
        products: widget.controller.products);
  }
}
