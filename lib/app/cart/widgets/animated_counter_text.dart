import 'package:flutter/material.dart';
import 'package:flutter_task_3/core/presentation/widgets/text_widget.dart';

class AnimatedCounterText extends StatelessWidget {
  final int value;
  const AnimatedCounterText(this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        child: TextWidget(data: '$value', color: Theme.of(context).hintColor));
  }
}
