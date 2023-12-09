import 'package:flutter/material.dart';

import '/core/presentation/widgets/text_widget.dart';

class EmptyCardsState extends StatelessWidget {
  const EmptyCardsState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.credit_card_rounded,
                size: 100.0, color: Theme.of(context).primaryColor),
            TextWidget(
                data:
                    'You don\'t have an payment card , click on (+) to add new card.',
                color: Theme.of(context).hintColor,
                textAlign: TextAlign.center,
                size: 18.0)
          ],
        ),
      ),
    );
  }
}
