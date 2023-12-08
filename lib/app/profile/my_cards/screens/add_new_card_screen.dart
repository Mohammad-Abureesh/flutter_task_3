import 'package:flutter/material.dart';
import 'package:flutter_task_3/core/presentation/widgets/general_app_bar.dart';

class AddNewCardScreen extends StatelessWidget {
  const AddNewCardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GeneralAppBar(title: 'Add New Card'),
    );
  }
}
