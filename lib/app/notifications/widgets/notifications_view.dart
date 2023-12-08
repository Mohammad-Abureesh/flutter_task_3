import 'package:flutter/material.dart';
import 'package:flutter_task_3/core/presentation/widgets/text_widget.dart';

class NotificationsView extends StatelessWidget {
  final String title;
  final Widget child;

  const NotificationsView({Key? key, required this.title, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      TextWidget.bold(data: title),
      const SizedBox(height: 15.0),
      child
    ]);
  }
}
