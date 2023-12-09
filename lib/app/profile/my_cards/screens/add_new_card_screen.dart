import 'package:flutter/material.dart';

import '/app/profile/my_cards/widgets/add_new_card_screen_body.dart';
import '/core/presentation/widgets/general_app_bar.dart';

class AddNewCardScreen extends StatelessWidget {
  const AddNewCardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GeneralAppBar(title: 'Add New Card'),
        body: const AddNewCardScreenBody());
  }
}
