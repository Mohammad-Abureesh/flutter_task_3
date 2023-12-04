import 'package:flutter/material.dart';
import 'package:flutter_task_3/app/profile/widgets/profile_setting_list_tile.dart';
import 'package:flutter_task_3/core/enums/e_profile_settings.dart';

class ProfileSettingsListView extends StatelessWidget {
  const ProfileSettingsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = EProfileSettings.values.toList();

    const SizedBox gap = SizedBox(height: 5.0);
    return Expanded(
        child: ListView.separated(
            itemCount: items.length,
            separatorBuilder: (_, index) => gap,
            itemBuilder: (_, index) =>
                ProfileSettingListTile(value: items.elementAt(index))));
  }
}
