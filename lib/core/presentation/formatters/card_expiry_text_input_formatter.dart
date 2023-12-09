import 'package:flutter/services.dart';

class ExpiryDateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text;
    if (text.length <= 5) {
      final trimmedValue = text.replaceAll(RegExp(r'[^0-9]'), '');
      final formattedValue = _formatExpiryDate(trimmedValue);

      return TextEditingValue(
        text: formattedValue,
        selection: TextSelection.collapsed(offset: formattedValue.length),
      );
    } else {
      // Prevent further input if the length exceeds MM/YY format
      return oldValue;
    }
  }

  String _formatExpiryDate(String input) {
    if (input.length > 2) {
      final month = input.substring(0, 2);
      final year = input.substring(2);
      return '$month/$year';
    }
    return input;
  }
}
