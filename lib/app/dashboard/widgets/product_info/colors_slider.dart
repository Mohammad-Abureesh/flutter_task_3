import 'package:flutter/material.dart';

import '/core/presentation/style/app_style.dart';

class ColorsSlider extends StatefulWidget {
  const ColorsSlider({super.key});

  @override
  State<ColorsSlider> createState() => _ColorsSliderState();
}

class _ColorsSliderState extends State<ColorsSlider> {
  Color? selected;

  void onSelect(Color color) {
    selected = color;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        children: Pallet.productColors
            .map((color) => ColorOption(
                  color: color,
                  onSelect: onSelect,
                  selected: color == selected,
                ))
            .toList());
  }
}

class ColorOption extends StatelessWidget {
  final bool selected;
  final Color color;

  final ValueChanged<Color> onSelect;

  const ColorOption(
      {super.key,
      required this.selected,
      required this.color,
      required this.onSelect});

  void _onTap() {
    onSelect(color);
  }

  @override
  Widget build(BuildContext context) {
    Widget? child;

    if (selected) {
      Color activeCheckColor =
          color == Colors.white ? Colors.black : Colors.white;
      child = Icon(Icons.check, color: activeCheckColor);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: InkWell(
          borderRadius: BorderRadius.circular(20.0),
          onTap: _onTap,
          child: CircleAvatar(backgroundColor: color, child: child)),
    );
  }
}
