import 'package:flutter/material.dart';
import 'package:flutter_task_3/core/domain/entities/notification_entity.dart';

import 'notification_card.dart';

class ActivityNotificationsListView extends StatelessWidget {
  final List<NotificationEntity> data;
  const ActivityNotificationsListView({Key? key, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: data.length,
        itemBuilder: (_, index) {
          return NotificationCard(data.elementAt(index));
        });
  }
}
