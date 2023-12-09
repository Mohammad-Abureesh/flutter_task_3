import 'package:flutter/cupertino.dart';
import 'package:flutter_task_3/core/domain/repositories/users_repository.dart';
import 'package:flutter_task_3/core/presentation/style/app_style.dart';
import 'package:flutter_task_3/core/utils/card_number_validator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

///Values order is required for [CardNumberValidator]
///should not me modified
enum EPaymentMethod {
  visa(FontAwesomeIcons.ccVisa),
  masterCard(FontAwesomeIcons.ccMastercard),
  applePay(FontAwesomeIcons.applePay),
  googlePay(FontAwesomeIcons.googlePay),
  paypal(FontAwesomeIcons.paypal),

  unknown(FontAwesomeIcons.question);

  const EPaymentMethod(this.icon);
  final IconData icon;

  factory EPaymentMethod.fromCardNumber(String cardNumber) {
    cardNumber = cardNumber.replaceAll(RegExp(r'\D'), '');
    if (cardNumber.length < 16) return unknown;

    return EPaymentMethod._findOrDefault(
      (e) => e._validatorRegex.hasMatch(
        cardNumber,
      ),
    );
  }

  factory EPaymentMethod._findOrDefault(bool Function(EPaymentMethod) test) {
    return values.firstWhereOrNull(test) ?? unknown;
  }
  RegExp get _validatorRegex {
    return switch (this) {
      visa => RegExp(r'^4[0-9]{12}(?:[0-9]{3})?$'),
      masterCard => RegExp(
          r'^5[1-5][0-9]{14}$|^2(22[1-9]|2[3-9][0-9]|[3-6][0-9]{2}|7[0-1][0-9]|720)\d{12}$'),
      paypal => RegExp(
          r'^((?:4026|417500|4508|4844|491(3|7))\d{12})|(?:4[0-9]{12}(?:[0-9]{3})?)$'),
      applePay => RegExp(r'^(?:5[06-8]\d{14})$'),
      googlePay => RegExp(r'^(?:4\d{15}|4\d{3}-\d{4}-\d{4}-\d{4})$'),
      _ => RegExp('')
    };
  }

  Color get background =>
      switch (this) { visa => Pallet.lightBlack, _ => Pallet.silver };
}
