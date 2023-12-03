import 'package:flutter/material.dart';
import 'package:flutter_task_3/app/dashboard/widgets/product_details_card.dart';
import 'package:flutter_task_3/core/domain/entities/category_entity.dart';
import 'package:flutter_task_3/core/extensions/string_ext.dart';
import 'package:flutter_task_3/core/presentation/widgets/text_widget.dart';

class CategoryCard extends StatelessWidget {
  final CategoryEntity value;
  const CategoryCard.details(this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    BorderRadius radius = BorderRadius.circular(20.0);

    return Material(
      elevation: 5.0,
      borderRadius: radius,
      child: ClipRRect(
        borderRadius: radius,
        child: Container(
          decoration: ProductCardDecoration.halfOpacity(value.image),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
                alignment: Alignment.topLeft,
                child: TextWidget.bold(data: value.title.toUpperFirstChar)),
          ),
        ),
      ),
    );
  }
}
