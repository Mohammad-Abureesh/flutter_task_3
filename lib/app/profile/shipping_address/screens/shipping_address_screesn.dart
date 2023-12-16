import 'package:flutter/material.dart';
import 'package:flutter_task_3/app/profile/shipping_address/controllers/shipping_address_screen_controller.dart';
import 'package:flutter_task_3/app/profile/shipping_address/widgets/shipping_address_screen_body.dart';
import 'package:flutter_task_3/core/presentation/widgets/general_app_bar.dart';

class ShippingAddressScreen extends StatelessWidget {
  ShippingAddressScreen({Key? key}) : super(key: key);

  final ShippingAddressScreenController controller =
      ShippingAddressScreenController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GeneralAppBar(title: 'Shipping Address', actions: [
          IconButton(
              onPressed: controller.addNewAddress, icon: const Icon(Icons.add))
        ]),
        body: ShippingAddressScreenBody(controller));
  }
}
