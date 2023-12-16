import 'package:flutter/material.dart';
import 'package:flutter_task_3/app/profile/shipping_address/widgets/selected_border.dart';
import 'package:flutter_task_3/core/enums/e_app_locales.dart';
import 'package:flutter_task_3/core/presentation/widgets/text_widget.dart';

class LanguageTile extends StatelessWidget {
  final AppLocales value;

  final bool active;

  final ValueChanged<AppLocales?>? onChanged;
  const LanguageTile(
      {Key? key, required this.value, required this.active, this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double radius = 15.0;

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: SelectedBorder(
          enabled: active,
          radius: radius,
          child: Card(
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius)),
              child: ListTile(
                  onTap: () => onChanged?.call(value),
                  leading: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.network(value.flag, fit: BoxFit.cover)),
                  title: TextWidget.bold(data: value.displayName)))),
    );
  }
}
