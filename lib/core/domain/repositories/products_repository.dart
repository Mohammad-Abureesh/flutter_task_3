import 'dart:convert';

import 'package:flutter/services.dart';

import '/core/domain/entities/product.dart';
import '/core/domain/entities/products_response.dart';

const int _defaultLimit = 10;

class ProductsRepository {
  static final ProductsRepository _repo = ProductsRepository._internalRepo();

  ProductsRepository._internalRepo();

  factory ProductsRepository() => _repo;

  late ProductsResponse _data;

  Future<void> init() async {
    var json = await _fetchData();
    _data = ProductsResponse.fromJson(json);
  }

  Future<Map<String, dynamic>> _fetchData() async {
    final String response =
        await rootBundle.loadString('assets/test/products.json');
    return Map.from(await json.decode(response));
  }

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
}
