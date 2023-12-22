import 'package:flutter_task_3/core/domain/entities/category_entity.dart';
import 'package:flutter_task_3/core/domain/gateway/categories_gateway.dart';

class CategoriesRepository {
  static final CategoriesRepository _repo =
      CategoriesRepository._internalRepo();

  CategoriesRepository._internalRepo() : _gateway = CategoriesGateway();

  factory CategoriesRepository() => _repo;

  final CategoriesGateway _gateway;

  Future<List<CategoryEntity>> categories() async =>
      (await _gateway.categories()).dataOrDefault([]);
}
