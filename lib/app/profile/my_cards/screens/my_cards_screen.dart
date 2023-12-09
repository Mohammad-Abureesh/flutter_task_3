import 'package:flutter/material.dart';
import 'package:flutter_task_3/app/profile/my_cards/controllers/cards_screen_controller.dart';
import 'package:flutter_task_3/app/profile/my_cards/widgets/cards_screen_body.dart';
import 'package:flutter_task_3/core/presentation/widgets/general_app_bar.dart';

import '../widgets/add_new_card_button.dart';

class MyCardsScreen extends StatefulWidget {
  const MyCardsScreen({Key? key}) : super(key: key);

  @override
  State<MyCardsScreen> createState() => _MyCardsScreenState();
}

class _MyCardsScreenState extends State<MyCardsScreen> {
  late final CardsScreenController controller;

  @override
  void initState() {
    controller = CardsScreenController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GeneralAppBar(
            title: 'My Cards',
            actions: [AddNewCardButton(controller.onAddNewCard)]),
        body: CardsScreenBody(controller));
  }
}
