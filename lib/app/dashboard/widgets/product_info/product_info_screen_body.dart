import 'package:flutter/material.dart';
import 'package:flutter_task_3/core/domain/entities/product.dart';
import 'package:flutter_task_3/core/domain/repositories/products_repository.dart';
import 'package:flutter_task_3/core/presentation/widgets/text_widget.dart';

import '../product_details_card.dart';
import 'colors_slider.dart';
import 'product_info_images_slider_view.dart';
import 'sizes_slider.dart';

class ProductInfoScreenBody extends StatefulWidget {
  const ProductInfoScreenBody({Key? key, required this.product})
      : super(key: key);

  final Product product;

  @override
  State<ProductInfoScreenBody> createState() => _ProductInfoScreenBodyState();
}

class _ProductInfoScreenBodyState extends State<ProductInfoScreenBody> {
  String? background;

  void onSelectImg(String value) {
    background = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) => Stack(children: [
        _Background(background ?? widget.product.image),
        _SheetDetails(widget.product, onSelectImg),
        const _BackButton()
      ]);
}

class _Background extends Container {
  _Background(String background)
      : super(decoration: ProductCardDecoration(background));
}

class _SheetDetails extends StatelessWidget {
  const _SheetDetails(this.product, this.onSelectImg);

  final Product product;
  final ValueChanged<String>? onSelectImg;

  void onAddProductToCart() {
    if (product.outOfStock) return;
    final repo = ProductsRepository();
    repo.addToMyCart(product);
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    const Radius radius = Radius.circular(30.0);

    const Size buttonSize = Size(double.infinity, 40.0);

    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        width: size.width,
        height: size.height * 0.5,
        child: Card(
          elevation: 10.0,
          margin: EdgeInsets.zero,
          shape: const RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.only(topLeft: radius, topRight: radius)),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _ProductSubDetailsView(product, onSelectImg),
                ElevatedButton(
                    onPressed: product.inStock ? onAddProductToCart : null,
                    style: ElevatedButton.styleFrom(minimumSize: buttonSize),
                    child: TextWidget.bold(
                        data: product.inStock
                            ? 'Add to Cart'
                            : 'Out of stock 😪')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Label extends TextWidget {
  ///Label with new line
  const _Label(String data) : super.bold(data: '$data\n', size: 18.0);
}

class _BackButton extends StatelessWidget {
  const _BackButton();

  @override
  Widget build(BuildContext context) => const SafeArea(
      child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Align(
              alignment: Alignment.topLeft,
              child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: BackButton(color: Colors.grey)))));
}

class _ProductSubDetailsView extends StatelessWidget {
  const _ProductSubDetailsView(this.product, this.onSelectImg);

  final Product product;
  final ValueChanged<String>? onSelectImg;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const vGap = SizedBox(height: 15.0);

    return Expanded(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                TextWidget.bold(
                    data: '\$${product.price}',
                    size: 20.0,
                    color: theme.primaryColor),
                if (product.hasDiscount) ...[
                  const SizedBox(width: 10.0),
                  TextWidget(
                      data: '\$${product.priceWithDiscount}',
                      color: theme.hintColor,
                      decoration: TextDecoration.lineThrough),
                  const SizedBox(width: 5.0),
                  Container(
                    padding: const EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        border: Border.all(color: Colors.redAccent)),
                    child: TextWidget(
                      data: '-${product.discountPercentage}% off',
                      color: Colors.redAccent,
                    ),
                  )
                ],
                const Spacer(),
                IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: null,
                    icon: Icon(Icons.favorite_border,
                        color: Theme.of(context).primaryColor))
              ],
            ),
            _Label(product.name),
            const _Label('Description'),
            TextWidget(
                data: product.description,
                color: theme.hintColor,
                overflow: TextOverflow.visible,
                size: 16.0),
            vGap,
            const _Label('Color'),
            const ColorsSlider(),
            vGap,
            const _Label('Size'),
            const SizeSlider(),
            vGap,
            const _Label('Images'),
            ProductInfoImagesSliderView(product, onSelectImg: onSelectImg)
          ],
        ),
      ),
    );
  }
}
