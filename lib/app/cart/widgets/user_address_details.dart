import 'package:flutter/material.dart';
import 'package:flutter_task_3/core/domain/entities/address.dart';
import 'package:flutter_task_3/core/presentation/widgets/text_widget.dart';

class UserAddressDetails extends StatelessWidget {
  final Address? address;
  final String name;
  const UserAddressDetails(
      {Key? key, required this.address, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String data = '';

    if (address != null) {
      data = '$name, ${address!.phone}'
          '\n${address!.street}'
          '\n${address!.city}-${address!.zipCode}';
    }
    return Row(children: [
      TextWidget(data: data, size: 18.0, color: Theme.of(context).hintColor)
    ]);
  }
}
