import 'package:flutter/material.dart';
import 'package:flutter_task_3/core/presentation/widgets/default_search_app_bar.dart';

import 'search_filter_button.dart';

class SearchDashboardAppBar extends DefaultSearchAppBar {
  SearchDashboardAppBar(
      {ValueChanged<String?>? onSearch, VoidCallback? onFilter, Key? key})
      : super(
            key: key,
            onSearch: onSearch,
            title: 'Search',
            searchHint: 'Search Here...',
            suffix: SearchFilterButton(onPressed: onFilter));
}
