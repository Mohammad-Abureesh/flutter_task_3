import 'package:flutter/material.dart';
import 'package:flutter_task_3/core/presentation/style/app_style.dart';
import 'package:flutter_task_3/core/presentation/widgets/text_widget.dart';

class FilterProductsSheet extends StatelessWidget {
  const FilterProductsSheet({Key? key, this.onChanged}) : super(key: key);
  final ValueChanged<RangeValues>? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const TextWidget(data: 'Select Min & Max price'),
          _RangeSlider(onChanged: onChanged),
        ],
      ),
    );
  }
}

class _RangeSlider extends StatelessWidget {
  _RangeSlider({this.onChanged})
      : _rangeNotifier = ValueNotifier<RangeValues>(const RangeValues(0, 1000));

  final ValueNotifier<RangeValues> _rangeNotifier;

  final ValueChanged<RangeValues>? onChanged;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: _rangeNotifier,
        builder: (_, value, child) => RangeSlider(
              values: value,
              max: 100000,
              divisions: 5,
              activeColor: Pallet.primary,
              labels: RangeLabels(
                value.start.round().toString(),
                value.end.round().toString(),
              ),
              onChanged: (RangeValues values) {
                onChanged?.call(values);
                _rangeNotifier.value = values;
              },
            ));
  }
}
