import 'package:flutter/material.dart';
import 'package:flutter_task_3/app/profile/shipping_address/controllers/shipping_address_screen_controller.dart';
import 'package:flutter_task_3/core/presentation/widgets/text_widget.dart';

import 'shipping_address_card.dart';

class ShippingAddressScreenBody extends StatefulWidget {
  final ShippingAddressScreenController controller;
  const ShippingAddressScreenBody(this.controller, {Key? key})
      : super(key: key);

  @override
  State<ShippingAddressScreenBody> createState() =>
      _ShippingAddressScreenBodyState();
}

class _ShippingAddressScreenBodyState extends State<ShippingAddressScreenBody> {
  ShippingAddressScreenController get controller => widget.controller;

  @override
  void initState() {
    super.initState();
    controller
      ..addListener(() {
        setState(() {});
      })
      ..inti();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextWidget(
            data: 'Your Shipping Addresses',
            color: Theme.of(context).hintColor),
        Expanded(
            child: ListView.builder(
                itemCount: controller.addresses.length,
                itemBuilder: (_, index) => ShippingAddressCard(
                    address: controller.addresses.elementAt(index))))
      ],
    );
  }
}
