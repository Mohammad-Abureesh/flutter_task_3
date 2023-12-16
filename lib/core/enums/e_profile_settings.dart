import 'package:flutter/material.dart';
import 'package:flutter_task_3/core/enums/e_app_pages.dart';
import 'package:flutter_task_3/core/utils/routing.dart';
import 'package:flutter_task_3/core/utils/session.dart';
import 'package:flutter_task_3/core/utils/string_utils.dart';

enum EProfileSettings {
  myAccount(Icons.account_circle_outlined),
  myOrders(Icons.shopping_bag_outlined),
  languageSettings(Icons.g_translate),
  shippingAddress(Icons.location_on_outlined),
  myCards(Icons.credit_card_sharp),
  settings(Icons.settings),
  privacyPolicy(Icons.receipt_long_outlined),
  faq(Icons.info_outline),
  logout(Icons.logout);

  const EProfileSettings(this.icon);
  final IconData icon;

  String get title => switch (this) {
        faq => name.toUpperCase(),
        _ => StringUtils.capitalizeAndJoin(name),
      };

  void impl(BuildContext context) {
    if (this == EProfileSettings.logout) {
      Session.logoutFromContext(context);
      return;
    }

    var page = switch (this) {
      myCards => EAppPages.myCards,
      shippingAddress => EAppPages.shippingAddress,
      _ => null,
    };
    if (page == null) return;

    Routing.fromAppPage(context, page)?.call();
  }
}
