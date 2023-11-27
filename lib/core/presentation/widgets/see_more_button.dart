import 'package:flutter/material.dart';
import 'package:flutter_task_3/core/presentation/widgets/text_widget.dart';

class SeeMoreButton extends TextButton {
  SeeMoreButton({super.key, required super.onPressed})
      : super(child: Builder(builder: (context) {
          return TextWidget(
              data: 'See More', color: Theme.of(context).hintColor);
        }));
}
