import 'package:flutter/material.dart';
import 'package:flutter_task_3/core/utils/string_utils.dart';

enum EProfileSettings {
  myAccount(Icons.account_circle_outlined),
  myOrders(Icons.shopping_bag_outlined),
  languageSettings(Icons.g_translate),
  shippingAddress(Icons.location_on_outlined),
  myCards(Icons.credit_card_sharp),
  settings(Icons.settings),
  privacyPolicy(Icons.receipt_long_outlined),
  faq(Icons.info_outline);

  const EProfileSettings(this.icon);
  final IconData icon;

  String get title => switch (this) {
        faq => name.toUpperCase(),
        _ => StringUtils.capitalizeAndJoin(name),
      };
}
