import 'package:flutter_task_3/core/domain/entities/product.dart';
import 'package:flutter_task_3/core/domain/repositories/products_repository.dart';
import 'package:flutter_task_3/core/enums/e_products_filter.dart';

class DashboardScreenController {
  DashboardScreenController() : _repository = ProductsRepository();
  final ProductsRepository _repository;

  Future<void> init() async {
    await _repository.init();
  }

  List<Product> fromFilter(ProductsFilter filter) {
    return switch (filter) {
      ProductsFilter.forYou => _repository.forYouProducts,
      ProductsFilter.featured => _repository.bestRatingProducts,
      ProductsFilter.bestSelling => _repository.bestRatingProducts
    };
  }
}
