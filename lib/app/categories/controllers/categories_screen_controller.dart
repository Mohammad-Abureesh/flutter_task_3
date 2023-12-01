import 'package:flutter_task_3/core/domain/entities/category_entity.dart';
import 'package:flutter_task_3/core/domain/repositories/categories_repository.dart';

class CategoriesScreenController {
  CategoriesScreenController() : categories = [];

  List<CategoryEntity> categories;
  void init() {
    categories = CategoriesRepository().extractCategoriesFromProducts;
  }

  void search(String? query) {
    query ??= '';
    if (query.isEmpty) {
      init();
      return;
    }

    categories = categories
        .where((element) =>
            element.title.toLowerCase().contains(query!.toLowerCase()))
        .toList();
  }
}
