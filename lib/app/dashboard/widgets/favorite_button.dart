import 'package:flutter/material.dart';

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
              onPressed: null,
              icon: Icon(Icons.favorite_border,
                  color: Theme.of(context).primaryColor)),
        ));
  }
}
