import 'package:flutter/material.dart';
import 'package:flutter_task_3/core/domain/entities/address.dart';
import 'package:flutter_task_3/core/presentation/widgets/text_widget.dart';
import 'package:flutter_task_3/core/utils/session.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ShippingAddressCard extends StatelessWidget {
  final Address address;

  final ValueChanged<Address?> onChanged;

  const ShippingAddressCard(
      {Key? key, required this.address, required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: ListTile(
        onTap: () => onChanged.call(address),
        leading: Icon(FontAwesomeIcons.locationDot,
            color: Theme.of(context).primaryColor),
        title: TextWidget.bold(
          data: '${Session.user.username},${address.phone}',
        ),
        subtitle: TextWidget(
            data:
                '${address.city}\n${address.street}-${address.zipCode}\n\n\n'),
      ),
    );
  }
}
