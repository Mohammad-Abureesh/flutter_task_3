import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_task_3/core/domain/entities/cart_item.dart';
import 'package:flutter_task_3/core/domain/repositories/users_repository.dart';

import '/core/domain/entities/product.dart';
import '/core/domain/entities/products_response.dart';

const int _defaultLimit = 10;

class ProductsRepository {
  static final ProductsRepository _repo = ProductsRepository._internalRepo();

  ProductsRepository._internalRepo();

  factory ProductsRepository() => _repo;

  late ProductsResponse _data;

  List<CartItem> _myCart = [];

  Future<void> init() async {
    var json = await _fetchData();
    _data = ProductsResponse.fromJson(json);
  }

  Future<Map<String, dynamic>> _fetchData() async {
    final String response =
        await rootBundle.loadString('assets/test/products.json');
    return Map.from(await json.decode(response));
  }

  int get numberOfItemsInCart => _myCart.length;

  List<Product> get products => _data.products;

  List<Product> get forYouProducts =>
      _randomFromLimits(products, _defaultLimit);

  List<Product> get bestSellingProducts {
    List<int> minStock = products.map((e) => e.stock).toSet().toList();
    minStock.sort();
    minStock = minStock.sublist(0, 5);
    return filter((p0) => minStock.contains(p0.stock), limit: _defaultLimit);
  }

  List<Product> get bestRatingProducts =>
      filter((p0) => p0.rating > 3, limit: _defaultLimit);

  List<Product> filter(bool Function(Product) test, {int? limit}) {
    List<Product> list = products.where(test).toList();
    return _randomFromLimits(list, limit);
  }

  List<Product> _randomFromLimits(List<Product> data, int? limit) {
    data.shuffle();

    if (limit != null && data.length > limit) {
      data = data.take(limit).toList();
    }
    return data;
  }

  void addToMyCart(Product product) {
    var item = findCartItemByProductId(product.id);
    if (item != null) {
      _myCart[_myCart.indexOf(item)].increment();
      return;
    }

    _myCart.add(CartItem.pushOne(product.id));
  }

  CartItem? findCartItemByProductId(int id) {
    return _myCart.firstWhereOrNull((element) => element.productId == id);
  }

  void removeAllFromCart() {
    _myCart = [];
  }
}
