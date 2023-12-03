import 'package:flutter/material.dart';
import 'package:flutter_task_3/app/dashboard/widgets/product_info/product_info_screen_body.dart';
import 'package:flutter_task_3/core/domain/entities/product.dart';

class ProductInfoScreen extends StatelessWidget {
  final Product product;

  const ProductInfoScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ProductInfoScreenBody(product: product));
  }
}
