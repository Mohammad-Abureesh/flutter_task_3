import 'package:flutter_task_3/core/domain/entities/user.dart';
import 'package:flutter_task_3/core/utils/session.dart';

class ProfileScreenController {
  ProfileScreenController() : user = Session.user;

  final User user;
}
