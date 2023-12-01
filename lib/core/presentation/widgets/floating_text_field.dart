import 'package:flutter/material.dart';
import 'package:flutter_task_3/core/presentation/widgets/text_widget.dart';

class FloatingTextField extends StatelessWidget {
  final TextEditingController? controller;

  final String? label;

  final String? hint;

  final ValueChanged<String?>? validator;

  final bool obscure;

  final EdgeInsets? padding;

  final int? maxLength;

  final double? radius;

  final String? counterText;

  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;

  final FocusNode? focusNode;

  final ValueChanged<String?>? onChanged;

  final Widget? prefixIcon;
  const FloatingTextField(
      {Key? key,
      this.controller,
      this.label,
      this.hint,
      this.validator,
      this.obscure = false,
      this.textAlign = TextAlign.start,
      this.padding,
      this.maxLength,
      this.radius,
      this.counterText,
      this.focusNode,
      this.onChanged,
      this.prefixIcon,
      this.textAlignVertical})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final radius = BorderRadius.circular(this.radius ?? 15.0);

    bool hasLabel = label != null;

    Widget field = Padding(
        padding: hasLabel
            ? padding ?? const EdgeInsets.only(top: 8.0)
            : EdgeInsets.zero,
        child: Material(
            elevation: 5.0,
            shadowColor: theme.hintColor,
            shape: RoundedRectangleBorder(borderRadius: radius),
            child: TextFormField(
                controller: controller,
                obscureText: obscure,
                maxLength: maxLength,
                textAlign: textAlign,
                focusNode: focusNode,
                onChanged: onChanged,
                textAlignVertical: textAlignVertical,
                decoration: InputDecoration(
                    prefixIcon: prefixIcon,
                    border: InputBorder.none,
                    counterText: counterText,
                    contentPadding: const EdgeInsets.all(10.0),
                    hintText: hint))));

    if (!hasLabel) return field;

    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [TextWidget(data: label!, color: theme.hintColor), field]);
  }
}

class FloatingPasswordField extends FloatingTextField {
  const FloatingPasswordField({Key? key, TextEditingController? controller})
      : super(
          key: key,
          controller: controller,
          label: 'Password',
          obscure: true,
          hint: 'e.g ${'*' * 10}',
        );
}

class FloatingSearchField extends StatelessWidget {
  final String? hint;
  final ValueChanged<String?>? onSearch;
  const FloatingSearchField({super.key, this.hint, this.onSearch});

  @override
  Widget build(BuildContext context) => FloatingTextField(
      textAlignVertical: TextAlignVertical.center,
      onChanged: onSearch,
      hint: hint ?? 'Search',
      radius: 25.0,
      prefixIcon: Icon(Icons.search, color: Theme.of(context).primaryColor));
}
