import 'package:flutter/material.dart';

import '/app/profile/my_cards/controllers/cards_screen_controller.dart';
import '/app/profile/my_cards/widgets/empty_cards_state.dart';
import '/app/profile/my_cards/widgets/my_cards_list_view.dart';
import '/core/presentation/widgets/text_widget.dart';

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

    return Column(children: [
      TextWidget(
          data: 'Your Payment Cards',
          size: 12.0,
          color: Theme.of(context).hintColor),
      const SizedBox(height: 20.0),
      Expanded(
          child: MyCardsListView(
              cards: widget.controller.cards.reversed.toList())),
    ]);
  }
}
