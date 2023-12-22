import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_task_3/core/domain/entities/user.dart';
import 'package:flutter_task_3/core/domain/repositories/users_repository.dart';
import 'package:flutter_task_3/core/enums/e_app_pages.dart';

import 'routing.dart';
import 'storage_utils.dart';

const loggedUserKey = 'isLoggedUser';

class Session {
  static final Session _session = Session._();

  Session._();

  late User _user;

  static User get user => _session._user;

  static void initSession(User user, bool saveSession) {
    _session._user = user;
    if (saveSession) _session._saveUser(user);
  }

  static Future<bool> initFromStorage() async {
    if (!isLogged) return false;
    var user = await UsersRepository().loginViaAccessToken(_token);
    if (user != null) _session._user = user;
    return user != null;
  }

  void _saveUser(User user) async {
    await StorageUtils.storage
        .setString(loggedUserKey, jsonEncode(user.toJson));
  }

  static String? get _token => StorageUtils.storage.getString('token');
  static bool get isLogged => _token != null;

  void _destroySession() {
    StorageUtils.storage.remove(loggedUserKey);
    StorageUtils.storage.remove('token');
  }

  static void logoutFromContext(BuildContext context) {
    _session._destroySession();
    Routing.replaceFromAppPage(context, EAppPages.login);
  }
}
