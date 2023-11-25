import 'package:flutter/material.dart';
import 'package:flutter_task_3/core/presentation/widgets/text_widget.dart';

class RegistrationHeader extends StatelessWidget {
  final String? title;
  final String? info;

  const RegistrationHeader({Key? key, this.title, this.info}) : super(key: key);
  const RegistrationHeader.forLogin({
    Key? key,
  }) : this(
            key: key,
            title: 'Welcome back!',
            info: 'Login to your exiting account');

  @override
  Widget build(BuildContext context) {
    if ([title, info].every((e) => (e ?? '').isEmpty)) {
      return const SizedBox.shrink();
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(data: title ?? '', fontWeight: FontWeight.bold, size: 25.0),
        Text(info ?? '')
      ],
    );
  }
}
