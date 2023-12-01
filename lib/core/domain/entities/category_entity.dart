import 'package:flutter_task_3/core/domain/entities/product.dart';

class CategoryEntity {
  final String title;
  final String image;

  CategoryEntity(this.title, this.image);

  CategoryEntity.extractFromProduct(Product product)
      : this(product.category, product.image);
}
