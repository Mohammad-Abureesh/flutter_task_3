import 'package:flutter/material.dart';
import 'package:flutter_task_3/core/domain/entities/notification_entity.dart';

class PromotionsNotificationsListView extends StatelessWidget {
  final List<NotificationEntity> data;
  const PromotionsNotificationsListView({Key? key, required this.data})
      : super(key: key);

  const PromotionsNotificationsListView.empty({Key? key})
      : data = const [],
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
