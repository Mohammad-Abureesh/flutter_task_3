import 'package:flutter/material.dart';
import 'package:flutter_task_3/core/presentation/widgets/text_widget.dart';

class FloatingTextField extends StatelessWidget {
  final TextEditingController? controller;

  final String? label;

  final String? hint;

  final ValueChanged<String?>? validator;

  final bool obscure;

  const FloatingTextField(
      {Key? key,
      this.controller,
      this.label,
      this.hint,
      this.validator,
      this.obscure = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final radius = BorderRadius.circular(15.0);
    Widget field = Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Material(
        elevation: 5.0,
        shadowColor: theme.hintColor,
        shape: RoundedRectangleBorder(borderRadius: radius),
        child: TextFormField(
          controller: controller,
          obscureText: obscure,
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.all(10.0),
              hintText: hint),
        ),
      ),
    );

    if (label == null) return field;

    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [TextWidget(data: label!, color: theme.hintColor), field]);
  }
}
