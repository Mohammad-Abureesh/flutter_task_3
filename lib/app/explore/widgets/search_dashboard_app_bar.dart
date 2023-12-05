import 'package:flutter/material.dart';
import 'package:flutter_task_3/core/presentation/widgets/default_search_app_bar.dart';

import 'search_filter_button.dart';

class SearchDashboardAppBar extends DefaultSearchAppBar {
  const SearchDashboardAppBar({ValueChanged<String?>? onSearch, Key? key})
      : super(
            key: key,
            onSearch: onSearch,
            title: 'Search',
            searchHint: 'Search Here...',
            suffix: const SearchFilterButton());
}
