import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum EPaymentMethod {
  paypal(FontAwesomeIcons.paypal),
  visa(FontAwesomeIcons.ccVisa),
  masterCard(FontAwesomeIcons.ccMastercard),
  applePay(FontAwesomeIcons.applePay),
  googlePay(FontAwesomeIcons.googlePay);

  const EPaymentMethod(this.icon);
  final IconData icon;
}
