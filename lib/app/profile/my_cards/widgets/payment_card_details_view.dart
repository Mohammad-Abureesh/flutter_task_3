import 'package:flutter/material.dart';
import 'package:flutter_task_3/core/domain/entities/payment_card.dart';
import 'package:flutter_task_3/core/presentation/style/app_style.dart';
import 'package:flutter_task_3/core/presentation/widgets/text_widget.dart';

class PaymentCardDetailsView extends StatelessWidget {
  const PaymentCardDetailsView({Key? key, required this.card})
      : super(key: key);

  final PaymentCard card;
  @override
  Widget build(BuildContext context) {
    const Color textColor = Colors.white;
    Color? iconColor = textColor;

    if (card.type.background == Pallet.silver) iconColor = null;

    return Card(
      color: card.type.background,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10.0),
            TextWidget.bold(data: card.bankName, size: 18.0, color: textColor),
            const SizedBox(height: 30.0),
            Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              TextWidget(data: card.cardNumber, size: 20.0, color: textColor),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: TextWidget(data: card.expiry, color: textColor),
              )
            ]),
            const SizedBox(height: 10.0),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              TextWidget(data: card.holderName, color: textColor),
              Icon(card.type.icon, color: iconColor)
            ]),
          ],
        ),
      ),
    );
  }
}
