import 'package:flutter_task_3/core/domain/entities/address.dart';

import '/core/domain/entities/user.dart';

final _testAddress = [
  Address('Hebron', '+97043247327', 'Aka', '0P1763'),
  Address('Street school,Official-Sch', '+099429341231', 'Al-zarka', 'MR0182'),
];

class UsersRepository {
  static final UsersRepository _repo = UsersRepository._internalRepo();

  UsersRepository._internalRepo();

  factory UsersRepository() => _repo;

  final List<User> _users = [
    User.create(
        username: 'mm', email: 'mm', password: 'mm', address: _testAddress)
  ];

  bool isExist(User user) {
    return _users.any((e) => e == user);
  }

  Future<void> create(User user) async {
    _users.add(user);
  }

  Future<User?> login(String nameOrEmail, String password) async {
    return _findByCredential(nameOrEmail, password);
  }

  Future<User?> _findByCredential(String nameOrEmail, String password) async {
    return _users.firstWhereOrNull(
        (element) => element.validCredential(nameOrEmail, password));
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
