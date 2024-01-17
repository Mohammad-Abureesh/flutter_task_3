import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task_3/core/presentation/style/app_style.dart';
import 'package:flutter_task_3/test/products_view/cubit/product_cubit.dart';
import 'package:flutter_task_3/test/products_view/screens/products_app.dart';

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductCubit>(
            create: (BuildContext context) => ProductCubit())
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.light,
          theme: LightTheme().theme,
          home: const ProductsApp()),
    );
  }
}
