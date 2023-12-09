import 'package:flutter/material.dart';
import 'package:flutter_task_3/core/presentation/widgets/text_widget.dart';

class CheckOutViewSection extends StatelessWidget {
  final String title;

  final String? actionText;
  final VoidCallback? onActionTap;

  final Widget child;

  final bool card;
  const CheckOutViewSection(
      {super.key,
      required this.title,
      this.actionText,
      this.onActionTap,
      this.card = false,
      required this.child});

  const CheckOutViewSection.card(
      {super.key,
      required this.title,
      this.actionText,
      this.onActionTap,
      required this.child})
      : card = true;

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [TextWidget.bold(data: title, size: 18.0)];

    if (actionText != null) {
      children.add(TextButton(
          onPressed: onActionTap,
          child: TextWidget(
              data: actionText!,
              size: 12.0,
              color: Theme.of(context).hintColor.withOpacity(0.45))));
    }

    Widget child = this.child;
    if (card) {
      child = Card(
          margin: EdgeInsets.zero,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          child: Padding(padding: const EdgeInsets.all(15.0), child: child));
    }

    return Column(children: [
      Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: children),
      const SizedBox(height: 5.0),
      child
    ]);
  }
}
