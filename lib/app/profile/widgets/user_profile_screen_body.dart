import 'package:flutter/material.dart';
import 'package:flutter_task_3/app/profile/controllers/profile_screen_controller.dart';
import 'package:flutter_task_3/app/profile/widgets/profile_settings_list_view.dart';
import 'package:flutter_task_3/app/profile/widgets/user_avatar.dart';

class UserProfileScreenBody extends StatelessWidget {
  UserProfileScreenBody({Key? key})
      : _controller = ProfileScreenController(),
        super(key: key);

  final ProfileScreenController _controller;
  @override
  Widget build(BuildContext context) {
    const double lRPadding = 15.0;

    return Padding(
        padding: const EdgeInsets.only(
          top: 40.0,
          left: lRPadding,
          right: lRPadding,
        ),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          UserAvatar(user: _controller.user),
          const SizedBox(height: 25.0),
          const ProfileSettingsListView(),
        ]));
  }
}
