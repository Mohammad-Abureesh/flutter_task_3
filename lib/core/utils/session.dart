import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_task_3/core/domain/entities/user.dart';
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

  static void initFromStorage() {
    if (!isLogged) return;
    _session._user = _session._userFromStorage!;
  }

  void _saveUser(User user) async {
    await StorageUtils.storage
        .setString(loggedUserKey, jsonEncode(user.toJson));
  }

  static bool get isLogged => _session._userFromStorage != null;

  User? get _userFromStorage {
    try {
      var json = StorageUtils.storage.getString(loggedUserKey);
      if (json == null) return null;
      return User.fromJson(jsonDecode(json));
    } catch (_) {
      return null;
    }
  }

  void _destroySession() {
    StorageUtils.storage.remove(loggedUserKey);
  }

  static void logoutFromContext(BuildContext context) {
    _session._destroySession();
    Routing.replaceFromAppPage(context, EAppPages.login);
  }
}
