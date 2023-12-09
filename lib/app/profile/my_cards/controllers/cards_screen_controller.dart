import 'package:flutter/material.dart';
import 'package:flutter_task_3/core/domain/entities/payment_card.dart';
import 'package:flutter_task_3/core/domain/repositories/cards_repository.dart';
import 'package:flutter_task_3/core/enums/e_app_pages.dart';
import 'package:flutter_task_3/core/utils/routing.dart';

class CardsScreenController with ChangeNotifier {
  CardsScreenController() : cards = [];
  List<PaymentCard> cards;

  void init() {
    cards = CardsRepository().cards;
  }

  void onAddNewCard(BuildContext context) async {
    await Routing.fromAppPage(context, EAppPages.addNewCard)?.call();
    init();
    notifyListeners();
  }
}
