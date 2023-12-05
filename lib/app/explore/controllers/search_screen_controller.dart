import 'package:flutter/foundation.dart';

import '/core/domain/entities/product.dart';
import '/core/domain/mixins/search_mixin.dart';
import '/core/domain/repositories/products_repository.dart';
import '/core/extensions/string_ext.dart';

class SearchScreenController with SearchMixin, ChangeNotifier {
  SearchScreenController() : _repository = ProductsRepository();

  List<Product>? products;

  final ProductsRepository _repository;
  @override
  void search(String? query) {
    products = [];

    if (query.isNullOrEmpty) {
      products = null;
      notifyListeners();
      return;
    }

    query = query!.toLowerCase();
    products = _repository.filter((element) => element.searchInfo.any(
          (element) => element.toLowerCase().contains(query!),
        ));

    notifyListeners();
  }
}
