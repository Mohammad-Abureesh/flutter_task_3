import 'package:flutter/material.dart';
import 'package:flutter_task_3/core/domain/entities/notification_entity.dart';
import 'package:flutter_task_3/core/presentation/widgets/text_widget.dart';

class NotificationCard extends StatelessWidget {
  final NotificationEntity item;
  const NotificationCard(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          child: Icon(item.icon, color: Theme.of(context).primaryColor),
        ),
        title: TextWidget.bold(data: item.title),
        subtitle: TextWidget(data: '${item.description}\n${item.date}'),
      ),
    );
  }
}
