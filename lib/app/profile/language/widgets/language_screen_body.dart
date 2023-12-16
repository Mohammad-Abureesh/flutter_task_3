import 'package:flutter/material.dart';
import 'package:flutter_task_3/app/profile/language/controllers/language_screen_controller.dart';
import 'package:flutter_task_3/app/profile/language/widgets/language_tile.dart';
import 'package:flutter_task_3/core/enums/e_app_locales.dart';
import 'package:flutter_task_3/core/presentation/widgets/text_widget.dart';

class LanguageScreenBody extends StatefulWidget {
  LanguageScreenBody({Key? key})
      : _controller = LanguageScreenController(),
        super(key: key);

  final LanguageScreenController _controller;

  @override
  State<LanguageScreenBody> createState() => _LanguageScreenBodyState();
}

class _LanguageScreenBodyState extends State<LanguageScreenBody> {
  @override
  void initState() {
    widget._controller
      ..addListener(() {
        setState(() {});
      })
      ..init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final items = AppLocales.values.toList();

    return Column(
      children: [
        TextWidget(
            data: 'Select a Language', color: Theme.of(context).hintColor),
        Expanded(
            child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (_, index) => LanguageTile(
                    value: items.elementAt(index),
                    onChanged: widget._controller.onChangeLocale,
                    active:
                        widget._controller.selected == items.elementAt(index))))
      ],
    );
  }
}
