import 'package:flutter/material.dart';

class SelectedBorder extends StatelessWidget {
  final bool enabled;
  final double radius;

  final Widget child;
  const SelectedBorder(
      {Key? key,
      required this.enabled,
      this.radius = 10.0,
      required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!enabled) return child;
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            border: Border.all(color: Theme.of(context).primaryColor)),
        child: child);
  }
}
