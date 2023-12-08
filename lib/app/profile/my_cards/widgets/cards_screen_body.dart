import 'package:flutter/material.dart';
import 'package:flutter_task_3/app/profile/my_cards/controllers/cards_screen_controller.dart';
import 'package:flutter_task_3/app/profile/my_cards/widgets/empty_cards_state.dart';

class CardsScreenBody extends StatefulWidget {
  final CardsScreenController controller;
  const CardsScreenBody(this.controller, {Key? key}) : super(key: key);

  @override
  State<CardsScreenBody> createState() => _CardsScreenBodyState();
}

class _CardsScreenBodyState extends State<CardsScreenBody> {
  @override
  void initState() {
    widget.controller
      ..addListener(() {
        setState(() {});
      })
      ..init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.controller.cards.isEmpty) {
      return const EmptyCardsState();
    }
    return ListView();
  }
}
