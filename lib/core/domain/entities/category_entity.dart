import 'package:flutter_task_3/core/domain/entities/product.dart';

class CategoryEntity {
  final int? id;
  final String title;
  final String image;

  CategoryEntity(this.title, this.image, this.id);

  CategoryEntity.extractFromProduct(Product product)
      : this(product.category, product.image, 0);

  factory CategoryEntity.fromJson(Map<String, dynamic> json) {
    return CategoryEntity(json['name'], json['image'], json['id']);
  }
}
