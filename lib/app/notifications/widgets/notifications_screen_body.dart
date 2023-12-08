import 'package:flutter/material.dart';

import '/app/notifications/controllers/notifications_screen_controller.dart';
import 'activity_notifications_list_view.dart';
import 'notifications_view.dart';
import 'promotions_notifications_list_view.dart';

class NotificationsScreenBody extends StatefulWidget {
  const NotificationsScreenBody({Key? key}) : super(key: key);

  @override
  State<NotificationsScreenBody> createState() =>
      _NotificationsScreenBodyState();
}

class _NotificationsScreenBodyState extends State<NotificationsScreenBody> {
  _NotificationsScreenBodyState()
      : _controller = NotificationsScreenController();

  @override
  void initState() {
    super.initState();
    _controller
      ..addListener(() {
        setState(() {});
      })
      ..init();
  }

  final NotificationsScreenController _controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: _controller.loading
          ? const CircularProgressIndicator()
          : SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  const NotificationsView(
                      title: 'Promotions',
                      child: PromotionsNotificationsListView.empty()),
                  const SizedBox(height: 20.0),
                  NotificationsView(
                      title: 'Your Activity',
                      child: ActivityNotificationsListView(
                          data: _controller.activity)),
                ])),
    );
  }
}
