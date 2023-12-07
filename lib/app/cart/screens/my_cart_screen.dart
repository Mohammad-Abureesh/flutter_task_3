import 'package:flutter/material.dart';
import 'package:flutter_task_3/app/cart/widgets/cart_screen_body.dart';
import 'package:flutter_task_3/core/presentation/widgets/general_app_bar.dart';

class MyCartScreen extends StatelessWidget {
  const MyCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: GeneralAppBar(title: 'My Cart'), body: const CartScreenBody());
}
