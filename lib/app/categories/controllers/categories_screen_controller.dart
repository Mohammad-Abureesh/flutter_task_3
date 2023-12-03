import 'dart:ui';

import 'package:flutter_task_3/core/domain/entities/category_entity.dart';
import 'package:flutter_task_3/core/domain/repositories/categories_repository.dart';

class CategoriesScreenController {
  CategoriesScreenController() : categories = [];

  List<CategoryEntity> categories;
  Future<void> init() async {
    categories = CategoriesRepository().extractCategoriesFromProducts;
  }

  VoidCallback? _notifyState;

  set notify(VoidCallback value) {
    _notifyState = value;
  }

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
