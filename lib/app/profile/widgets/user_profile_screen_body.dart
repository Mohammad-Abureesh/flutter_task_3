import 'package:flutter/material.dart';
import 'package:flutter_task_3/core/domain/entities/user.dart';
import 'package:flutter_task_3/core/presentation/widgets/text_widget.dart';
import 'package:flutter_task_3/core/utils/session.dart';

class UserProfileScreenBody extends StatelessWidget {
  const UserProfileScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User user = Session.user;

    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextWidget(data: user.username),
            TextWidget(data: user.email),
            TextWidget(data: 'Join at ${user.joinAt}'),
          ],
        ),
      ),
    );
  }
}
