import 'package:flutter/material.dart';
import 'package:flutter_task_3/core/presentation/widgets/text_widget.dart';

class SizeSlider extends StatefulWidget {
  const SizeSlider({super.key});

  @override
  State<SizeSlider> createState() => _SizeSliderState();
}

class _SizeSliderState extends State<SizeSlider> {
  int? selected;

  void onSelect(int value) {
    selected = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final sizes = [13, 14, 15, 20];
    return Row(
        children: sizes
            .map((size) => _SizeOption(
                selected: selected == size, onSelect: onSelect, size: size))
            .toList());
  }
}

class _SizeOption extends StatelessWidget {
  final int size;
  final bool selected;
  final ValueChanged<int> onSelect;

  const _SizeOption(
      {required this.size, required this.selected, required this.onSelect});

  void _onPressed() {
    onSelect.call(size);
  }

  @override
  Widget build(BuildContext context) {
    const buttonSize = MaterialStatePropertyAll(Size(35.0, 45.0));

    MaterialStatePropertyAll<BorderSide>? side;

    if (selected) {
      side = MaterialStatePropertyAll(
          BorderSide(color: Theme.of(context).primaryColor));
    }

    return OutlinedButton(
        style: ButtonStyle(
            minimumSize: buttonSize,
            maximumSize: buttonSize,
            side: side,
            padding: const MaterialStatePropertyAll(EdgeInsets.zero)),
        onPressed: _onPressed,
        child: TextWidget(data: '$size"'));
  }
}
