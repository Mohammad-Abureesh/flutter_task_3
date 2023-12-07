// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_task_3/app/cart/screens/check_out_screen.dart';
import 'package:flutter_task_3/core/domain/entities/cart_item.dart';
import 'package:flutter_task_3/core/domain/entities/product.dart';
import 'package:flutter_task_3/core/domain/repositories/products_repository.dart';
import 'package:flutter_task_3/core/utils/routing.dart';

class CartScreenController extends ValueNotifier<List<CartItem>> {
  CartScreenController()
      : _repository = ProductsRepository(),
        super([]);

  final ProductsRepository _repository;

  double total = 0;

  double get subTotal => 0.0;

  double get _total {
    if (value.isEmpty) return 0.0;
    return value.map((e) => finProduct(e.productId).price * e.quantity).sum;
  }

  void init() async {
    value = _repository.allInMyCart;
    total = _total;
    notifyListeners();
  }

  void addProductToCart(Product product) {
    if (value
            .firstWhere((element) => element.productId == product.id)
            .quantity ==
        product.stock) {
      return;
    }

    _repository.addToMyCart(product);
    init();
  }

  void removeProduct(Product product) {
    _repository.removeFromMyCart(product);
    init();
  }

  Product finProduct(int id) {
    return _repository.findProductCallback.call(id);
  }

  void onCheckOut(BuildContext context) {
    if (value.isEmpty) return;
    Routing.of(context, const CheckOutScreen())?.call();
  }
}
