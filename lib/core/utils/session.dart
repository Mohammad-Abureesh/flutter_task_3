import 'package:flutter_task_3/core/domain/entities/user.dart';

class Session {
  static final Session _session = Session._();

  Session._();

  late User _user;

  static User get user => _session._user;

  static void initSession(User user) {
    _session._user = user;
  }
}
