import 'package:flutter/material.dart';
import 'package:flutter_task_3/core/domain/entities/product.dart';
import 'package:flutter_task_3/core/presentation/widgets/text_widget.dart';

import 'favorite_button.dart';

const double productCardHeight = 180.0;

///Base product card radius
const double mainProductCardRadius = 20.0;

class ProductDetailsCard extends StatelessWidget {
  final Product product;

  final bool otherStyle;
  const ProductDetailsCard(
      {Key? key, this.otherStyle = false, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = productCardHeight * 0.70;
    double height = productCardHeight / 1.5;

    double? opacity;

    AlignmentGeometry subChildAlign;

    FontWeight? titleWeight;

    Widget? subChild;

    EdgeInsets outerPadding;

    Widget productNameChild = TextWidget(
        data: product.name,
        maxLines: 2,
        fontWeight: titleWeight,
        overflow: TextOverflow.ellipsis);

    if (otherStyle) {
      width = width * 2.3;
      opacity = 0.4;
      subChildAlign = Alignment.topLeft;
      titleWeight = FontWeight.bold;
      outerPadding = const EdgeInsets.all(8.0);
      subChild = Padding(padding: outerPadding, child: productNameChild);
    } else {
      outerPadding = const EdgeInsets.symmetric(horizontal: 8.0);
      subChildAlign = Alignment.bottomRight;
      subChild = FavoriteButton(productId: product.id);
    }

    BorderRadius borderRadius = BorderRadius.circular(mainProductCardRadius);
    Widget mainChild = Material(
      elevation: 5.0,
      borderRadius: borderRadius,
      shadowColor: Colors.grey.shade200,
      child: ClipRRect(
          borderRadius: borderRadius,
          child: Container(
              width: width,
              height: height,
              padding: EdgeInsets.zero,
              decoration:
                  ProductCardDecoration(product.image, opacity: opacity),
              child: Align(alignment: subChildAlign, child: subChild))),
    );

    if (!otherStyle) {
      mainChild = Container(
          constraints: BoxConstraints(maxWidth: width),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                mainChild,
                const SizedBox(height: 5.0),
                productNameChild,
                const Spacer(),
                TextWidget(
                    data: '\$${product.price}',
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    size: 18.0),
              ]));
    }

    return InkWell(
      onTap: product.openProductInfoScreenCallback(context),
      borderRadius: borderRadius,
      child: SizedBox(
          height: height,
          child: Padding(padding: outerPadding, child: mainChild)),
    );
  }
}

class ProductCardDecoration extends BoxDecoration {
  ProductCardDecoration(String img, {BoxBorder? border, double? opacity})
      : super(
            border: border,
            image: img.isNotEmpty
                ? DecorationImage(
                    opacity: opacity ?? 1.0,
                    image: NetworkImage(img),
                    fit: BoxFit.cover)
                : null);

  ProductCardDecoration.halfOpacity(String img) : this(img, opacity: 0.5);

  ProductCardDecoration.fromProduct(Product product) : this(product.image);
}
