import 'package:flutter/material.dart';
import 'package:flutter_task_3/core/presentation/widgets/submit_button.dart';
import 'package:flutter_task_3/core/presentation/widgets/text_widget.dart';

class PayNowCardDetails extends StatelessWidget {
  final double total;
  final VoidCallback payNow;

  const PayNowCardDetails(this.total, this.payNow, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const TextWidget.bold(data: 'Coupon'),
          Row(mainAxisSize: MainAxisSize.min, children: [
            TextWidget(data: 'Add Coupon', color: Theme.of(context).hintColor),
            Icon(Icons.arrow_forward_ios,
                size: 10.0, color: Theme.of(context).hintColor)
          ])
        ]),
        const SizedBox(height: 15.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const TextWidget(data: 'Total', size: 10.0),
              TextWidget.bold(data: '\$$total'),
            ]),
            SizedBox(
                width: 120,
                child: SubmitButton(
                    title: 'Pay Now', radius: 5.0, onPressed: payNow)),
          ],
        ),
      ],
    );
  }
}
