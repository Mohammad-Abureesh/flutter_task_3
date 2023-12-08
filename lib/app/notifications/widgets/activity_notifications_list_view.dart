import 'package:flutter/material.dart';
import 'package:flutter_task_3/core/domain/entities/notification_entity.dart';
import 'package:flutter_task_3/core/presentation/widgets/text_widget.dart';

import 'notification_card.dart';

class ActivityNotificationsListView extends StatelessWidget {
  final List<NotificationEntity> data;
  const ActivityNotificationsListView({Key? key, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) {
      return const TextWidget(data: 'You don\'t have activity\'s');
    }

    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: data.length,
        itemBuilder: (_, index) {
          return NotificationCard(data.elementAt(index));
        });
  }
}
