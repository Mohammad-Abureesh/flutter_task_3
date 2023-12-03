import 'package:flutter/material.dart';
import 'package:flutter_task_3/core/presentation/widgets/text_widget.dart';

class EmptyListView extends StatelessWidget {
  const EmptyListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Center(
        child: Column(children: [
          Icon(Icons.receipt_long, size: 100.0),
          TextWidget(data: 'Oops no result found!')
        ]),
      );
}
