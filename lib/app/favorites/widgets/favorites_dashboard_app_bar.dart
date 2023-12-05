import 'package:flutter/material.dart';
import 'package:flutter_task_3/core/presentation/widgets/default_search_app_bar.dart';

class FavoritesDashboardAppBar extends DefaultSearchAppBar {
  const FavoritesDashboardAppBar({Key? key, ValueChanged<String?>? onSearch})
      : super(
            key: key,
            onSearch: onSearch,
            title: 'Wish List',
            searchHint: 'Search Product');
}
