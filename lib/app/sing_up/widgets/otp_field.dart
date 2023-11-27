import 'package:flutter/material.dart';
import 'package:flutter_task_3/core/presentation/widgets/floating_text_field.dart';

const _otpSize = Size.square(45.0);

class OtpField extends StatelessWidget {
  final ValueChanged<String> onComplete;
  const OtpField({Key? key, required this.onComplete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controllers = List.generate(4, (index) => TextEditingController());
    final nodes = controllers.map((e) => FocusNode()).toList();

    FocusNode? nextNode(int index) {
      if (index < nodes.length) return nodes.elementAt(index);
      return null;
    }

    fieldBuilder(TextEditingController controller) {
      final index = controllers.indexOf(controller);
      return _OtpField._(
          controller: controller,
          onComplete: onComplete,
          node: nodes.elementAt(index),
          nextNode: nextNode(index + 1));
    }

    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: controllers.map(fieldBuilder).toList());
  }
}

class _OtpField extends FloatingTextField {
  _OtpField._(
      {required TextEditingController controller,
      required ValueChanged<String> onComplete,
      required FocusNode node,
      required FocusNode? nextNode})
      : super(
            counterText: '',
            hint: '_',
            maxLength: 1,
            textAlign: TextAlign.center,
            controller: controller,
            focusNode: node,
            onChanged: (String? value) {
              value ??= '';
              if (value.length != 1) return;
              nextNode?.requestFocus();
              if (nextNode == null) node.unfocus();
              onComplete.call(value);
            },
            radius: 5.0);

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: SizedBox.fromSize(size: _otpSize, child: super.build(context)));
}
