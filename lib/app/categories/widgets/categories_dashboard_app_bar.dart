import 'package:flutter/material.dart';

import '/core/presentation/widgets/default_app_bar_state.dart';
import '/core/presentation/widgets/floating_text_field.dart';
import 'app_bar_title_text.dart';

class CategoriesDashboardAppBar extends DefaultAppBarState {
  final ValueChanged<String?>? onSearch;
  const CategoriesDashboardAppBar({this.onSearch, Key? key}) : super(key: key);

  @override
  Widget child(BuildContext context) => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            const AppBarTitleText(title: 'Categories'),
            const Spacer(),
            FloatingSearchField(
              hint: 'Search Category',
              onSearch: onSearch,
            )
          ]);

  @override
  Size get preferredSize => const Size.fromHeight(120.0);
}
