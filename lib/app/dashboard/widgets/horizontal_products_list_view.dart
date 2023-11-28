import 'package:flutter/material.dart';
import 'package:flutter_task_3/app/dashboard/widgets/product_details_card.dart';
import 'package:flutter_task_3/core/domain/entities/product.dart';

class HorizontalProductsListView extends StatelessWidget {
  final List<Product> products;
  final bool enableOtherStyle;

  const HorizontalProductsListView(
      {Key? key, this.enableOtherStyle = false, required this.products})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: enableOtherStyle ? productCardHeight * 0.85 : productCardHeight,
      child: ListView.builder(
          itemCount: products.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) => ProductDetailsCard(
              product: products.elementAt(index),
              otherStyle: enableOtherStyle)),
    );
  }
}
