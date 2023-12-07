import 'package:flutter/material.dart';
import 'package:flutter_task_3/core/presentation/widgets/text_widget.dart';

class TotalText extends StatelessWidget {
  final String text;
  final num value;
  const TotalText({super.key, required this.text, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      TextWidget(data: text, size: 12.0),
      TextWidget.bold(data: '\$$value')
    ]);
  }
}
