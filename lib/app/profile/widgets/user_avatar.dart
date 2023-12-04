import 'package:flutter/material.dart';
import 'package:flutter_task_3/core/domain/entities/user.dart';
import 'package:flutter_task_3/core/presentation/widgets/text_widget.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
            backgroundColor: Theme.of(context).primaryColor,
            radius: 45.0,
            child: const Icon(Icons.person)),
        const SizedBox(height: 10.0),
        TextWidget.bold(data: user.username.toUpperCase(), size: 18.0),
        TextWidget(
            data: user.joinAt, size: 12.0, color: Theme.of(context).hintColor),
      ],
    );
  }
}
