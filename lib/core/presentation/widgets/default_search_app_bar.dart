import 'package:flutter/material.dart';
import 'package:flutter_task_3/core/presentation/widgets/app_bar_title_text.dart';

import '/core/presentation/widgets/default_app_bar_state.dart';
import '/core/presentation/widgets/floating_text_field.dart';

class DefaultSearchAppBar extends DefaultAppBarState {
  final ValueChanged<String?>? onSearch;

  final String? title;
  final String? searchHint;

  final double height;

  const DefaultSearchAppBar({
    this.onSearch,
    this.title,
    this.searchHint,
    Key? key,
    this.height = 120.0,
  }) : super(key: key);

  @override
  Widget child(BuildContext context) => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            AppBarTitleText(title: title),
            const Spacer(),
            FloatingSearchField(hint: searchHint, onSearch: onSearch)
          ]);

  @override
  Size get preferredSize => Size.fromHeight(height);
}
