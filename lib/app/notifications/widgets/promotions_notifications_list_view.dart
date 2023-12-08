import 'package:flutter/material.dart';
import 'package:flutter_task_3/core/domain/entities/notification_entity.dart';
import 'package:flutter_task_3/core/presentation/widgets/text_widget.dart';

class PromotionsNotificationsListView extends StatelessWidget {
  final List<NotificationEntity> data;
  const PromotionsNotificationsListView({Key? key, required this.data})
      : super(key: key);

  const PromotionsNotificationsListView.empty({Key? key})
      : data = const [],
        super(key: key);

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) {
      return const TextWidget(data: 'You don\'t have promotions now');
    }
    return Container();
  }
}
