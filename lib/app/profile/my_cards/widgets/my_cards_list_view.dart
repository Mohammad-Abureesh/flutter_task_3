import 'package:flutter/material.dart';

import '/core/domain/entities/payment_card.dart';
import 'payment_card_details_view.dart';

class MyCardsListView extends StatelessWidget {
  const MyCardsListView({Key? key, required this.cards}) : super(key: key);

  final List<PaymentCard> cards;
  @override
  Widget build(BuildContext context) {
    const SizedBox gap = SizedBox(height: 8.0);
    return ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        itemCount: cards.length,
        itemBuilder: (_, index) =>
            PaymentCardDetailsView(card: cards.elementAt(index)),
        separatorBuilder: (_, index) => gap);
  }
}
