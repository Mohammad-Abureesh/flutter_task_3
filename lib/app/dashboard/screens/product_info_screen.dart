import 'package:flutter/material.dart';
import 'package:flutter_task_3/app/dashboard/widgets/product_details_card.dart';
import 'package:flutter_task_3/core/domain/entities/product.dart';
import 'package:flutter_task_3/core/presentation/widgets/text_widget.dart';

class ProductInfoScreen extends StatelessWidget {
  final Product product;

  const ProductInfoScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Expanded(
              child: Container(
                  decoration: ProductCardDecoration.fromProduct(product))),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: size.width,
              height: size.height * 0.5,
              child: Card(
                child: Column(
                  children: [
                    TextWidget(data: 'Price ${product.price}'),
                    TextWidget(data: product.name),
                    ElevatedButton(onPressed: null, child: Text('add to card')),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
