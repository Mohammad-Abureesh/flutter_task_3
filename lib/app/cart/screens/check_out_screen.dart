import 'package:flutter/material.dart';
import 'package:flutter_task_3/app/cart/widgets/check_out_screen_body.dart';
import 'package:flutter_task_3/core/presentation/widgets/general_app_bar.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GeneralAppBar(title: 'Check Out'),
      body: CheckOutScreenBody(),
    );
  }
}
