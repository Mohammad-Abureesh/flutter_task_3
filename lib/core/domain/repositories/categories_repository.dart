import 'package:flutter_task_3/core/domain/entities/category_entity.dart';
import 'package:flutter_task_3/core/domain/entities/product.dart';
import 'package:flutter_task_3/core/domain/repositories/products_repository.dart';

class CategoriesRepository {
  static final CategoriesRepository _repo =
      CategoriesRepository._internalRepo();

  CategoriesRepository._internalRepo();

  factory CategoriesRepository() => _repo;

  List<CategoryEntity> get extractCategoriesFromProducts {
    List<Product> products = ProductsRepository().products;
    Set<String> categories = products.map((e) => e.category).toSet();

    return categories
        .map((category) =>
            products.firstWhere((product) => product.category == category))
        .map(CategoryEntity.extractFromProduct)
        .toList();
  }
}
