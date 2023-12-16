import 'package:flutter/material.dart';
import 'package:flutter_task_3/app/profile/language/widgets/language_screen_body.dart';
import 'package:flutter_task_3/core/presentation/widgets/general_app_bar.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GeneralAppBar(title: 'Language'), body: LanguageScreenBody());
  }
}
