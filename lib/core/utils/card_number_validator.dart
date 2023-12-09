import '../enums/e_payment_method.dart';

class CardNumberValidator {
  static ({EPaymentMethod method, bool isValid}) validate(String cardNumber) {
    EPaymentMethod method = EPaymentMethod.fromCardNumber(cardNumber);
    return (method: method, isValid: method != EPaymentMethod.unknown);
  }
}
