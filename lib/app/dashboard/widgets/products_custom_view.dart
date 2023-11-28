import 'package:flutter/material.dart';
import 'package:flutter_task_3/app/dashboard/widgets/horizontal_products_list_view.dart';
import 'package:flutter_task_3/core/domain/entities/product.dart';
import 'package:flutter_task_3/core/enums/e_products_filter.dart';
import 'package:flutter_task_3/core/presentation/widgets/see_more_button.dart';
import 'package:flutter_task_3/core/presentation/widgets/text_widget.dart';

class ProductsCustomView extends StatelessWidget {
  final ProductsFilter filter;

  final List<Product> data;

  final VoidCallback? onSeeMore;

  final bool enableOtherStyle;
  const ProductsCustomView(
      {Key? key,
      required this.filter,
      this.enableOtherStyle = false,
      required this.data,
      this.onSeeMore})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                        data: filter.title,
                        fontWeight: FontWeight.bold,
                        size: 16.0),
                    SeeMoreButton(onPressed: onSeeMore)
                  ])),
          if (!enableOtherStyle) const SizedBox(height: 5.0),
          HorizontalProductsListView(
              products: data, enableOtherStyle: enableOtherStyle)
        ]);
  }
}
