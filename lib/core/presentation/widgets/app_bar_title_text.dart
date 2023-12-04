import 'package:flutter/material.dart';
import 'package:flutter_task_3/core/presentation/widgets/text_widget.dart';

class AppBarTitleText extends TextWidget {
  const AppBarTitleText({Key? key, double? size, String? title})
      : super.bold(
            key: key,
            data: title ?? '',
            size: size ?? 18.0,
            maxLines: 1,
            overflow: TextOverflow.ellipsis);
}
