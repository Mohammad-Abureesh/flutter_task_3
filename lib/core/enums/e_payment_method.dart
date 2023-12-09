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

  factory EPaymentMethod.findOrDefault(bool Function(EPaymentMethod) test) {
    return values.firstWhereOrNull(test) ?? unknown;
  }

  Color get background =>
      switch (this) { visa => Pallet.lightBlack, _ => Pallet.silver };

  static List<EPaymentMethod> get allowedMethods {
    final unAllowed = [EPaymentMethod.unknown];
    return values.where((method) => !unAllowed.contains(method)).toList();
  }
}
