import 'package:flutter_task_3/core/domain/entities/cart_item.dart';
import 'package:flutter_task_3/core/domain/entities/category_entity.dart';
import 'package:flutter_task_3/core/domain/entities/favorite_item.dart';
import 'package:flutter_task_3/core/domain/gateway/products_gateway.dart';
import 'package:flutter_task_3/core/domain/repositories/users_repository.dart';
import 'package:flutter_task_3/core/enums/e_favorite_type.dart';

import '/core/domain/entities/product.dart';
import '/core/domain/entities/products_response.dart';

const int _defaultLimit = 10;

class ProductsRepository {
  static final ProductsRepository _repo = ProductsRepository._internalRepo();

  ProductsRepository._internalRepo() : _gateway = ProductsGateway();

  factory ProductsRepository() => _repo;

  late ProductsResponse _data;

  List<CartItem> _myCart = [];

  List<FavoriteItem>? _favorites;

  final ProductsGateway _gateway;

  Future<void> init() async {
    var data = await _gateway.products();
    _data = ProductsResponse(data, data.length);
  }

  int get numberOfItemsInCart => _myCart.length;

  List<CartItem> get allInMyCart => _myCart;

  List<Product> get allProductsInMyCart {
    if (allInMyCart.isEmpty) return [];
    return allInMyCart.map((e) => _findProductById(e.productId)).toList();
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

  List<Product> get allFavoritesProducts {
    return _favorites
            ?.where((element) => element.type == EFavoriteType.product)
            .map((e) => _findProductById(e.id))
            .toList() ??
        [];
  }

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
    if (product.outOfStock) return;

    var item = findCartItemByProductId(product.id);
    if (item != null) {
      if (item.quantity == product.stock) return;
      _myCart[_myCart.indexOf(item)].increment();
      return;
    }

    _myCart.add(CartItem.pushOne(product.id));
  }

  void removeFromMyCart(Product product) {
    var item = findCartItemByProductId(product.id);
    if (item == null) return;
    item.decrement();
    if (item.zeroQuantity) {
      _myCart.remove(item);
    }
  }

  CartItem? findCartItemByProductId(int id) {
    return _myCart.firstWhereOrNull((element) => element.productId == id);
  }

  Product _findProductById(int id) {
    return products.firstWhere((element) => element.id == id);
  }

  Product Function(int id) get findProductCallback => _findProductById;

  void removeAllFromCart() {
    _myCart = [];
  }

  ({bool sucess, bool state}) addOrRemoveToFavorites(int id) {
    Product product = _findProductById(id);
    final callback =
        inFavorites(product.id) ? removeFromFavorites : saveAsFavorites;
    return (sucess: callback.call(product), state: inFavorites(id));
  }

  bool inFavorites(int id) {
    return _favorites?.any((f) => f.id == id) ?? false;
  }

  bool saveAsFavorites(Product product) {
    _favorites ??= [];
    _favorites!.add(FavoriteItem.product(product.id));
    return true;
  }

  bool removeFromFavorites(Product product) {
    if (_favorites == null) return false;
    _favorites!.removeWhere((e) => e.id == product.id);
    return true;
  }

  Future<List<Product>> productsByQuery(String query) {
    return _gateway.products(params: query);
  }

  Future<List<Product>> byCategory(CategoryEntity category) {
    return productsByQuery('categoryId=${category.id}');
  }
}
