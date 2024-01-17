import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task_3/app/explore/widgets/short_product_info_card.dart';
import 'package:flutter_task_3/test/products_view/cubit/product_cubit.dart';
import 'package:flutter_task_3/test/products_view/cubit/products_states.dart';

class ProductsListScreen extends StatelessWidget {
  const ProductsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<ProductCubit>();

    if (controller.products.isEmpty) {
      return const Center(child: Text('EMPTY Products'));
    }

    return ListView.separated(
      itemCount: controller.products.length,
      itemBuilder: (context, index) {
        final product = controller.products[index];
        return ShortProductInfoCard(
          product: product,
          trailing: BlocBuilder<ProductCubit, ProductStates>(
              builder: (context, state) {
            return IconButton(
                padding: EdgeInsets.zero,
                onPressed: () => controller.saveOrRemove(product),
                icon: Icon(
                    product.inFavorites()
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: Theme.of(context).primaryColor));
          }),
        );
      },
      separatorBuilder: (_, index) => const SizedBox(height: 10.0),
    );
  }
}
