import 'dart:ui';

import '/core/domain/entities/category_entity.dart';
import '/core/domain/mixins/search_mixin.dart';
import '/core/domain/repositories/categories_repository.dart';

class CategoriesScreenController with SearchMixin {
  CategoriesScreenController() : categories = [];

  List<CategoryEntity> categories;
  Future<void> init() async {
    categories = CategoriesRepository().extractCategoriesFromProducts;
  }

  VoidCallback? _notifyState;

  set notify(VoidCallback value) {
    _notifyState = value;
  }

  @override
  void search(String? query) {
    query ??= '';
    if (query.isEmpty) {
      init();
      _notify();
      return;
    }

    categories = categories
        .where((element) =>
            element.title.toLowerCase().contains(query!.toLowerCase()))
        .toList();
    _notify();
  }

  void _notify() {
    _notifyState?.call();
  }
}
