import 'package:flutter/material.dart';
import 'package:flutter_task_3/app/explore/widgets/short_products_info_list_view.dart';
import 'package:flutter_task_3/app/registration/sing_up/widgets/default_app_bar.dart';
import 'package:flutter_task_3/core/domain/entities/category_entity.dart';
import 'package:flutter_task_3/core/domain/entities/product.dart';
import 'package:flutter_task_3/core/domain/repositories/products_repository.dart';

class CategoryProducts extends StatefulWidget {
  final CategoryEntity category;
  const CategoryProducts({Key? key, required this.category}) : super(key: key);

  @override
  State<CategoryProducts> createState() => _CategoryProductsState();
}

class _CategoryProductsState extends State<CategoryProducts> {
  bool loading = true;

  List<Product> products = [];
  @override
  void initState() {
    super.initState();
    ProductsRepository().byCategory(widget.category).then((value) {
      products = value;
      loading = false;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DefaultAppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: loading
              ? const Center(child: CircularProgressIndicator())
              : ShortProductsInfoListView(products: products),
        ));
  }
}
