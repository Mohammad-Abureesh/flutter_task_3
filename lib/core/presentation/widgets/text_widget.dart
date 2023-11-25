import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String data;

  final Color? color;

  final FontWeight? fontWeight;

  final double? size;

  const TextWidget(
      {Key? key, required this.data, this.color, this.fontWeight, this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(color: color, fontSize: size, fontWeight: fontWeight),
    );
  }
}
