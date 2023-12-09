import 'package:flutter_task_3/core/domain/entities/payment_card.dart';

class CardsRepository {
  static final CardsRepository _repo = CardsRepository._internalRepo();

  CardsRepository._internalRepo();

  factory CardsRepository() => _repo;

  List<PaymentCard> cards = [];

  void addCard(PaymentCard card) {
    cards.add(card);
  }
}
