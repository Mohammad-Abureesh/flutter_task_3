import 'package:flutter/material.dart';
import 'package:flutter_task_3/app/notifications/widgets/notifications_screen_body.dart';
import 'package:flutter_task_3/core/presentation/widgets/general_app_bar.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GeneralAppBar(title: 'Notifications'),
      body: const NotificationsScreenBody(),
    );
  }
}
