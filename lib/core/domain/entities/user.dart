import '/core/utils/json_convertor.dart';
import 'address.dart';

class User {
  String username;
  String email;

  String? _password;

  DateTime _createdAt;

  List<Address>? _addresses;

  User._(this.email, this.username, this._password, this._addresses)
      : _createdAt = DateTime.now();
  User.create(
      {required String username,
      required String email,
      required String password,
      List<Address>? address})
      : this._(email, username, password, address);

  Map<String, dynamic> get toJson => {
        'email': email,
        'password': _password,
        'username': username,
        'address': _addresses?.map((e) => e.toJson)
      };

  factory User.fromJson(Map<String, dynamic> json) {
    return User._(
        json['email'],
        json['username'],
        json['password'],
        JsonConvertor()
            .nullableIterable(json['address'], Address.fromJson)
            ?.whereType<Address>()
            .toList());
  }

  @override
  bool operator ==(Object other) {
    if (other is! User) return false;
    return other.hashCode == hashCode &&
        email == other.email &&
        username == other.username;
  }

  @override
  int get hashCode => username.hashCode ^ email.hashCode;

  List<Address> get address => _addresses?.whereType<Address>().toList() ?? [];

  String get joinAt => _createdAt.toIso8601String();

  bool validCredential(String nameOrEmail, String password) {
    return _password == password &&
        (nameOrEmail == username || nameOrEmail == email);
  }
}
