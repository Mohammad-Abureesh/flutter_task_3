import 'package:flutter/services.dart';

class CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');
    final formatted = _format(text);

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }

  String _format(String input) {
    final buffer = StringBuffer();

    for (int i = 0; i < input.length; i += 4) {
      final end = i + 4;
      if (end <= input.length) {
        buffer.write('${input.substring(i, end)} ');
      } else {
        buffer.write(input.substring(i));
        break;
      }
    }

    return buffer.toString().trim();
  }
}
