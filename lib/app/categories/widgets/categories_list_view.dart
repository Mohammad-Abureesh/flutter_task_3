import 'package:flutter/material.dart';

import '/core/domain/entities/category_entity.dart';
import 'category_card.dart';

class CategoriesListView extends StatelessWidget {
  final List<CategoryEntity> data;
  const CategoriesListView({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 2, children: data.map(CategoryCard.details).toList());
  }
}
