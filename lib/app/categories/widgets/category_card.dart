import 'package:flutter/material.dart';
import 'package:flutter_task_3/core/domain/entities/category_entity.dart';

class CategoryCard extends StatelessWidget {
  final CategoryEntity value;
  const CategoryCard.details(this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Text(value.title),
    );
  }
}
