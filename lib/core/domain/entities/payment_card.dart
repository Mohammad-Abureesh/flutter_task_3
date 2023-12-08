import 'package:flutter_task_3/core/enums/e_payment_method.dart';

class PaymentCard {
  final String bankName;
  final String cardNumber;
  final String expiry;
  final String holderName;

  final EPaymentMethod type;

  PaymentCard(
    this.bankName,
    this.cardNumber,
    this.expiry,
    this.holderName,
    this.type,
  );
}
