import 'package:flutter_task_3/core/domain/entities/address.dart';
import 'package:flutter_task_3/core/domain/entities/login_request.dart';
import 'package:flutter_task_3/core/domain/gateway/user_gateway.dart';
import 'package:flutter_task_3/core/utils/storage_utils.dart';

import '/core/domain/entities/user.dart';

final testAddress = [
  Address('Hebron', '+97043247327', 'Aka', '0P1763'),
  Address('Street school,Official-Sch', '+099429341231', 'Al-zarka', 'MR0182'),
];

class UsersRepository {
  static final UsersRepository _repo = UsersRepository._internalRepo();

  UsersRepository._internalRepo() : _gateway = UserGateway();

  factory UsersRepository() => _repo;

  final UserGateway _gateway;

  Future<bool> create(User user) => _gateway.singUp(user);

  Future<User?> loginViaAccessToken(String? token) async {
    return _gateway.userProfile(token);
  }

  Future<User?> login(String nameOrEmail, String password) async {
    return loginViaAccessToken(
        await _accessToken(LoginRequest(nameOrEmail, password)));
  }

  Future<String?> _accessToken(LoginRequest request) async {
    String? accessToken = (await _gateway.login(request)).accessToken;
    if (accessToken is String) {
      StorageUtils.storage.setString('token', accessToken);
    }
    return accessToken;
  }
}

extension FirstWhereExt<T> on List<T> {
  T? firstWhereOrNull(bool Function(T element) test) {
    for (var element in this) {
      if (test(element)) return element;
    }
    return null;
  }
}
