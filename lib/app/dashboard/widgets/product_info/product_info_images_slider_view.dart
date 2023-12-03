import 'package:flutter/material.dart';
import 'package:flutter_task_3/app/dashboard/widgets/product_details_card.dart';
import 'package:flutter_task_3/core/domain/entities/product.dart';

class ProductInfoImagesSliderView extends StatelessWidget {
  const ProductInfoImagesSliderView(this.product, {Key? key, this.onSelectImg})
      : super(key: key);

  final Product product;

  final ValueChanged<String>? onSelectImg;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 70.0,
        child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: product.slider
                .map((img) => InkWell(
                      onTap: () {
                        onSelectImg?.call(img);
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Container(
                          height: 65.0,
                          width: 50.0,
                          margin: const EdgeInsets.symmetric(horizontal: 10.0),
                          decoration: ProductCardDecoration(img,
                              border: Border.all(
                                  color: Theme.of(context).primaryColor)),
                        ),
                      ),
                    ))
                .toList()));
  }
}
