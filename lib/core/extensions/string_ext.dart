import 'package:flutter/material.dart';

extension StringExt on String {
  String get toUpperFirstChar {
    if (isEmpty) return '';
    String first = characters.first;
    return replaceFirst(first, first.toUpperCase());
  }
}

extension NullableStringExt on String? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;
}
