import 'package:flutter/material.dart';

import '/core/presentation/widgets/default_app_bar_state.dart';
import '/core/presentation/widgets/floating_text_field.dart';
import 'app_bar_title_text.dart';

class CategoriesDashboardAppBar extends DefaultAppBarState {
  const CategoriesDashboardAppBar({Key? key}) : super(key: key);

  @override
  Widget child(BuildContext context) => const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppBarTitleText(title: 'Categories'),
            FloatingSearchField(hint: 'Search Category')
          ]);

  @override
  Size get preferredSize => const Size.fromHeight(140.0);
}
