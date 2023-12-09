import 'package:flutter/cupertino.dart';

import '/core/domain/entities/payment_card.dart';
import '/core/domain/repositories/cards_repository.dart';
import '/core/enums/e_payment_method.dart';
import '/core/extensions/string_ext.dart';
import '/core/utils/card_number_validator.dart';

class AddCardScreenController with ChangeNotifier {
  AddCardScreenController()
      : bankName = TextEditingController(),
        holderName = TextEditingController(),
        cardNumber = TextEditingController(),
        expiry = TextEditingController(),
        formKey = GlobalKey<FormState>(),
        method = EPaymentMethod.unknown;

  final GlobalKey<FormState> formKey;

  EPaymentMethod method;

  TextEditingController bankName;
  TextEditingController cardNumber;
  TextEditingController holderName;
  TextEditingController expiry;

  String? cardNumberValidator(String? value) {
    if (value.isNullOrEmpty) return 'Enter card number';
    ({bool isValid, EPaymentMethod method}) r =
        CardNumberValidator.validate(value!);
    _updatePaymentMethod = r.method;
    return r.isValid ? null : 'Invalid card number';
  }

  String? defaultValidator(String? value) {
    if (value.isNullOrEmpty) return 'Required field';
    return null;
  }

  set _updatePaymentMethod(EPaymentMethod method) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      this.method = method;
      notifyListeners();
    });
  }

  void onAdd() {
    if (!(formKey.currentState?.validate() ?? false)) return;
    final card = PaymentCard(
      bankName.text,
      cardNumber.text,
      expiry.text,
      holderName.text,
      method,
    );
    CardsRepository().addCard(card);
    _clearFields();
  }

  void _clearFields() {
    bankName.clear();
    holderName.clear();
    cardNumber.clear();
    expiry.clear();
    _updatePaymentMethod = EPaymentMethod.unknown;
  }
}
