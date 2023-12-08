import 'package:flutter/material.dart';
import 'package:flutter_task_3/core/presentation/widgets/app_bar_title_text.dart';

class GeneralAppBar extends AppBar {
  GeneralAppBar({Key? key, String? title, List<Widget>? actions})
      : super(
            key: key,
            title: AppBarTitleText(title: title),
            centerTitle: true,
            actions: actions,
            shadowColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            foregroundColor: Colors.black);
}
