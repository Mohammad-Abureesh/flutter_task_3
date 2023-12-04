import 'package:flutter/material.dart';
import 'package:flutter_task_3/core/presentation/widgets/app_bar_title_text.dart';

import '/core/presentation/widgets/default_app_bar_state.dart';
import '/core/presentation/widgets/floating_text_field.dart';

class DefaultSearchAppBar extends DefaultAppBarState {
  final ValueChanged<String?>? onSearch;

  final String? title;
  final String? searchHint;

  final double height;

  final Widget? suffix;

  const DefaultSearchAppBar({
    Key? key,
    this.suffix,
    this.onSearch,
    this.title,
    this.searchHint,
    this.height = 120.0,
  }) : super(key: key);

  @override
  Widget child(BuildContext context) {
    Widget search = FloatingSearchField(hint: searchHint, onSearch: onSearch);

    //change layout to if has [suffix] widget
    if (suffix != null) {
      search = Row(children: [Expanded(child: search), suffix!]);
    }

    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          AppBarTitleText(title: title),
          const Spacer(),
          search
        ]);
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
