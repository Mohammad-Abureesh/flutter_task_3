import 'package:flutter/material.dart';
import 'package:flutter_task_3/core/domain/entities/product.dart';
import 'package:flutter_task_3/core/presentation/widgets/text_widget.dart';

class ProductDetailsCard extends StatelessWidget {
  final Product product;
  const ProductDetailsCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextWidget(data: '${product.name}\n${product.description}');
  }
}
