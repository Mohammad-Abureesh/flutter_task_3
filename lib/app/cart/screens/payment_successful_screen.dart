import 'package:flutter/material.dart';

import '/core/presentation/widgets/general_app_bar.dart';
import '/core/presentation/widgets/submit_button.dart';
import '/core/presentation/widgets/text_widget.dart';

class PaymentSuccessfulScreen extends StatelessWidget {
  const PaymentSuccessfulScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const SizedBox gap = SizedBox(height: 15.0);

    return Scaffold(
      appBar: GeneralAppBar(title: 'Payment'),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.check_circle,
                  color: Theme.of(context).primaryColor, size: 60.0),
              gap,
              const TextWidget(data: 'Payment Successful!', size: 18.0),
              gap,
              const TextWidget(
                  data: 'Your order will be processed an sent to '
                      'you as soon as possible',
                  textAlign: TextAlign.center),
              gap,
              gap,
              SubmitButton(
                  title: 'Continue Shopping',
                  onPressed: Navigator.of(context).pop)
            ]),
      ),
    );
  }
}
