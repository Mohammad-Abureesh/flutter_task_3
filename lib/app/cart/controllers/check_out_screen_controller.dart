// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_task_3/app/cart/screens/payment_successful_screen.dart';
import 'package:flutter_task_3/core/domain/entities/address.dart';
import 'package:flutter_task_3/core/domain/entities/product.dart';
import 'package:flutter_task_3/core/domain/entities/user.dart';
import 'package:flutter_task_3/core/domain/repositories/products_repository.dart';
import 'package:flutter_task_3/core/utils/routing.dart';
import 'package:flutter_task_3/core/utils/session.dart';

class CheckOutScreenController with ChangeNotifier {
  CheckOutScreenController() : _user = Session.user;

  List<Product> get items => ProductsRepository().allProductsInMyCart;
  void init() {
    address = _user.address.firstOrNull;
  }

  double get total {
    return ProductsRepository()
        .allInMyCart
        .map((e) =>
            e.quantity *
            items.firstWhere((element) => e.productId == element.id).price)
        .sum;
  }

  final User _user;
  Address? address;

  String shippingMode = 'Flat Rate';

  String get username => _user.username;

  void payNow(BuildContext context) {
    Routing.of(context, const PaymentSuccessfulScreen())?.call();
  }
}
