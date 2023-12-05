import 'package:flutter/cupertino.dart';
import 'package:flutter_task_3/core/domain/entities/product.dart';
import 'package:flutter_task_3/core/domain/mixins/search_mixin.dart';
import 'package:flutter_task_3/core/domain/repositories/products_repository.dart';

class FavoritesScreenController with SearchMixin, ChangeNotifier {
  List<Product>? favorites;

  Future<void> init() async {
    favorites = ProductsRepository().allFavoritesProducts;
  }

  @override
  void search(String? query) {
    query ??= '';
    if (query.isEmpty) {
      init();
      notifyListeners();
      return;
    }

    query = query.toLowerCase();
    favorites = favorites
        ?.where((element) => element.searchInfo
            .any((element) => element.toLowerCase().contains(query!)))
        .toList();
    notifyListeners();
  }
}
