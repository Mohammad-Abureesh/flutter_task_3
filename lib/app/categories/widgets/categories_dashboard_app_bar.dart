import 'package:flutter/material.dart';

import '/core/presentation/widgets/default_search_app_bar.dart';

class CategoriesDashboardAppBar extends DefaultSearchAppBar {
  const CategoriesDashboardAppBar({ValueChanged<String?>? onSearch, Key? key})
      : super(
            key: key,
            onSearch: onSearch,
            title: 'Categories',
            searchHint: 'Search Category');
}
