import 'package:flutter/cupertino.dart';
import 'package:flutter_task_3/core/domain/entities/notification_entity.dart';
import 'package:flutter_task_3/core/utils/fetch_test_json.dart';
import 'package:flutter_task_3/core/utils/json_convertor.dart';

class NotificationsScreenController with ChangeNotifier {
  NotificationsScreenController() : activity = [];
  List<NotificationEntity> activity;

  bool loading = false;
  Future<void> init() async {
    _progress = true;
    var json = await FetchTestJson(
      'notifications',
    ).fetchData;
    activity = JsonConvertor<NotificationEntity>()
        .safeIterable(json['notifications'], NotificationEntity.fromJson)
        .toList();

    _progress = false;
  }

  set _progress(bool value) {
    loading = value;
    notifyListeners();
  }
}
