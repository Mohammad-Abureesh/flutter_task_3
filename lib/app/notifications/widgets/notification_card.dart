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
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          leading: CircleAvatar(
              radius: 15.0,
              backgroundColor: Colors.grey.shade200,
              child: Icon(item.icon,
                  color: Theme.of(context).primaryColor, size: 15.0)),
          title: TextWidget.bold(data: item.title),
          subtitle: TextWidget(data: '\n${item.description}\n\n${item.date}')),
    );
  }
}
