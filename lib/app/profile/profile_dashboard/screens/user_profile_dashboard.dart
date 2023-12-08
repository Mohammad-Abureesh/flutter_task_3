import 'package:flutter/material.dart';
import 'package:flutter_task_3/app/profile/profile_dashboard/widgets/user_profile_screen_body.dart';

class UserProfileDashboard extends StatelessWidget {
  const UserProfileDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: UserProfileScreenBody());
  }
}
