import 'package:flutter/material.dart';
import 'package:flutter_task_3/app/explore/widgets/short_product_info_card.dart';
import 'package:flutter_task_3/core/domain/entities/cart_item.dart';
import 'package:flutter_task_3/core/domain/entities/product.dart';

import 'animated_counter_text.dart';

class CartItemCard extends StatelessWidget {
  final CartItem item;
  final Product Function(int id) findProduct;

  final void Function(Product) onAdd;
  final void Function(Product) onRemove;

  const CartItemCard(
      {super.key,
      required this.item,
      required this.findProduct,
      required this.onAdd,
      required this.onRemove});

  @override
  Widget build(BuildContext context) {
    final product = findProduct(item.productId);

    add() => onAdd(product);
    remove() => onRemove(product);

    return ShortProductInfoCard(
        superHPadding: 20.0,
        product: product,
        trailing: _CounterChile(
          value: item.quantity,
          add: add,
          remove: remove,
        ));
  }
}

class _CounterChile extends StatelessWidget {
  final VoidCallback add;
  final VoidCallback remove;

  final int value;
  const _CounterChile(
      {required this.add, required this.remove, required this.value});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        InkWell(onTap: add, child: Icon(Icons.add, color: theme.primaryColor)),
        AnimatedCounterText(value),
        InkWell(
            onTap: remove, child: Icon(Icons.remove, color: theme.hintColor)),
      ],
    );
  }
}
