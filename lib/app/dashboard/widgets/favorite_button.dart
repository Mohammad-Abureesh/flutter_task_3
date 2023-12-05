import 'package:flutter/material.dart';
import 'package:flutter_task_3/core/domain/repositories/products_repository.dart';

import 'product_details_card.dart';

class FavoriteButton extends StatefulWidget {
  final int productId;
  const FavoriteButton({super.key, required this.productId});

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    isFavorite = ProductsRepository().inFavorites(widget.productId);
  }

  void _onPressed() {
    if (!mounted) return;
    isFavorite =
        ProductsRepository().addOrRemoveToFavorites(widget.productId).state;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
        size: const Size.square(30.0),
        child: Card(
          margin: EdgeInsets.zero,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(mainProductCardRadius),
                  topLeft: Radius.circular(mainProductCardRadius / 1.5))),
          child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: _onPressed,
              icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: Theme.of(context).primaryColor)),
        ));
  }
}
