import '../enums/e_payment_method.dart';

class CardNumberValidator {
  static ({EPaymentMethod method, bool isValid}) validate(String cardNumber) {
    cardNumber = cardNumber.replaceAll(RegExp(r'\D'), '');
    EPaymentMethod method;

    if (cardNumber.length < 16) {
      method = EPaymentMethod.unknown;
    } else {
      method = EPaymentMethod.findOrDefault(
        (e) => e._validatorRegex.hasMatch(
          cardNumber,
        ),
      );
    }

    return (method: method, isValid: method != EPaymentMethod.unknown);
  }
}

extension _CardNumberRegxExt on EPaymentMethod {
  RegExp get _validatorRegex {
    return switch (this) {
      EPaymentMethod.visa => RegExp(r'^4[0-9]{12}(?:[0-9]{3})?$'),
      EPaymentMethod.masterCard => RegExp(
          r'^5[1-5][0-9]{14}$|^2(22[1-9]|2[3-9][0-9]|[3-6][0-9]{2}|7[0-1][0-9]|720)\d{12}$'),
      EPaymentMethod.paypal => RegExp(
          r'^((?:4026|417500|4508|4844|491(3|7))\d{12})|(?:4[0-9]{12}(?:[0-9]{3})?)$'),
      EPaymentMethod.applePay => RegExp(r'^(?:5[06-8]\d{14})$'),
      EPaymentMethod.googlePay =>
        RegExp(r'^(?:4\d{15}|4\d{3}-\d{4}-\d{4}-\d{4})$'),
      _ => RegExp('')
    };
  }
}
