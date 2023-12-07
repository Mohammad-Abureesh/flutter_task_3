import 'package:flutter/material.dart';
import 'package:flutter_task_3/core/enums/e_app_pages.dart';
import 'package:flutter_task_3/core/enums/e_profile_settings.dart';
import 'package:flutter_task_3/core/presentation/widgets/text_widget.dart';
import 'package:flutter_task_3/core/utils/pages_manager.dart';
import 'package:flutter_task_3/core/utils/routing.dart';
import 'package:flutter_task_3/core/utils/session.dart';

class ProfileSettingListTile extends StatelessWidget {
  const ProfileSettingListTile({Key? key, required this.value})
      : super(key: key);

  final EProfileSettings value;
  @override
  Widget build(BuildContext context) {
    onTap() {
      if (value == EProfileSettings.logout) {
        Session.destroySession();
        Routing.replace(
            context, PagesManager.routeBuilder(EAppPages.login).call());
      }
    }

    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: ListTile(
        onTap: onTap,
        leading: Icon(value.icon, color: Colors.black),
        trailing: const Icon(Icons.arrow_forward_ios, size: 12.0),
        title: TextWidget(data: value.title),
      ),
    );
  }
}
