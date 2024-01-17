import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task_3/test/products_view/cubit/product_cubit.dart';
import 'package:flutter_task_3/test/products_view/cubit/products_states.dart';
import 'package:flutter_task_3/test/products_view/screens/products_list_view.dart';

class ProductsApp extends StatefulWidget {
  const ProductsApp({Key? key}) : super(key: key);

  @override
  State<ProductsApp> createState() => _ProductsAppState();
}

class _ProductsAppState extends State<ProductsApp> {
  @override
  void initState() {
    super.initState();
    context.read<ProductCubit>().init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: BlocBuilder<ProductCubit, ProductStates>(builder: (context, state) {
        if (state is WaitingState) {
          return const Center(child: CircularProgressIndicator());
        }

        return const ProductsListScreen();
      }),
    );
  }
}
