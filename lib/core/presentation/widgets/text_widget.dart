import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String data;

  final Color? color;

  final FontWeight? fontWeight;

  final double? size;

  final int? maxLines;

  final TextOverflow? overflow;
  const TextWidget(
      {Key? key,
      required this.data,
      this.color,
      this.fontWeight,
      this.size,
      this.maxLines,
      this.overflow})
      : super(key: key);

  const TextWidget.bold(
      {Key? key,
      required this.data,
      this.color,
      this.size,
      this.maxLines,
      this.overflow})
      : fontWeight = FontWeight.bold,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(color: color, fontSize: size, fontWeight: fontWeight),
    );
  }
}
