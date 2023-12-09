import 'package:flutter/material.dart';
import 'package:flutter_task_3/app/cart/widgets/check_out_view_section.dart';
import 'package:flutter_task_3/core/presentation/widgets/text_widget.dart';

class CheckOutSummaryView extends StatelessWidget {
  const CheckOutSummaryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CheckOutViewSection(
        title: 'Order Summary',
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(18.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                  color: Theme.of(context).textTheme.bodyLarge?.color ??
                      Colors.grey)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                  data: 'Order date ${DateTime.now().toIso8601String()}'),
              const TextWidget(data: 'Status : In Progress '),
            ],
          ),
        ));
  }
}
