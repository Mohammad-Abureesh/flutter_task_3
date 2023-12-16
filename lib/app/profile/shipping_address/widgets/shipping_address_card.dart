import 'package:flutter/material.dart';
import 'package:flutter_task_3/core/domain/entities/address.dart';
import 'package:flutter_task_3/core/presentation/widgets/text_widget.dart';
import 'package:flutter_task_3/core/utils/session.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ShippingAddressCard extends StatelessWidget {
  final Address address;
  const ShippingAddressCard({Key? key, required this.address})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(FontAwesomeIcons.locationDot),
        title: TextWidget.bold(
          data: '${Session.user.username},${address.phone}',
        ),
        subtitle: TextWidget(
            data: '${address.city}\n${address.street}-${address.zipCode}'),
      ),
    );
  }
}
