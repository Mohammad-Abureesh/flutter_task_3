import 'package:flutter/cupertino.dart';
import 'package:flutter_task_3/core/domain/entities/payment_card.dart';

class CardsScreenController with ChangeNotifier {
  CardsScreenController() : cards = [];
  List<PaymentCard> cards;

  void onAddNewCard(BuildContext context) {}
}
