import 'package:flutter/material.dart';
import 'package:flutter_task_3/app/explore/widgets/short_product_info_card.dart';
import 'package:flutter_task_3/core/domain/entities/product.dart';
import 'package:flutter_task_3/core/presentation/widgets/empty_list_view.dart';

class ShortProductsInfoListView extends StatelessWidget {
  ///To build list of [ShortProductInfoCard] from products list
  ///
  /// [ShortProductsInfoListView] have empty state if [products] null or
  /// empty
  const ShortProductsInfoListView(
      {Key? key, List<Product>? products, this.padding, this.onAddToCart})
      : products = products ?? const [],
        super(key: key);

  final List<Product> products;

  final EdgeInsets? padding;

  final ValueChanged<Product>? onAddToCart;

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) return const EmptyListView();

    const SizedBox gap = SizedBox(height: 10.0);
    return ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: padding,
        itemCount: products.length,
        shrinkWrap: true,
        itemBuilder: (_, index) => ShortProductInfoCard(
            superHPadding: padding?.horizontal,
            onAddToCart: onAddToCart,
            product: products.elementAt(index)),
        separatorBuilder: (_, index) => gap);
  }
}
