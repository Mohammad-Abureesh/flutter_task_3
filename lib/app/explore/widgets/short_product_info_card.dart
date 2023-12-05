import 'package:flutter/material.dart';

import '/app/dashboard/screens/product_info_screen.dart';
import '/app/dashboard/widgets/product_details_card.dart';
import '/core/domain/entities/product.dart';
import '/core/presentation/widgets/text_widget.dart';
import '/core/utils/routing.dart';

class ShortProductInfoCard extends StatelessWidget {
  const ShortProductInfoCard(
      {Key? key,
      required this.product,
      double? superHPadding,
      this.onAddToCart})
      : superHPadding = superHPadding ?? 0.0,
        super(key: key);

  final Product product;
  final double superHPadding;

  final ValueChanged<Product>? onAddToCart;

  void _onAddToCart() {
    onAddToCart?.call(product);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    const double radius = 20.0;
    const double width = 65.0;
    const double height = 100.0;
    const double horizontalLeadingPadding = 10.0;

    double maxNameWidth = MediaQuery.sizeOf(context).width -
        (superHPadding * 2 + width + horizontalLeadingPadding * 2) -
        50.0;

    final borderRadius = BorderRadius.circular(radius);
    return InkWell(
      borderRadius: borderRadius,
      onTap: Routing.of(context, ProductInfoScreen(product: product)),
      child: Card(
        elevation: 4.0,
        shadowColor: Colors.grey.shade200,
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
        margin: EdgeInsets.zero,
        child: Row(children: [
          ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(radius),
                  topLeft: Radius.circular(radius)),
              child: Container(
                  width: width,
                  height: height,
                  decoration: ProductCardDecoration.fromProduct(product))),
          const SizedBox(width: 15.0),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    constraints: BoxConstraints(maxWidth: maxNameWidth),
                    child: TextWidget(data: product.name, maxLines: 3)),
                const SizedBox(height: height / 4.0),
                TextWidget.bold(
                    data: '\$${product.price}', color: theme.primaryColor),
              ]),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: horizontalLeadingPadding),
            child: IconButton(
              onPressed: _onAddToCart,
              icon: Icon(Icons.add_shopping_cart_outlined,
                  color: theme.primaryColor),
            ),
          )
        ]),
      ),
    );
  }
}
