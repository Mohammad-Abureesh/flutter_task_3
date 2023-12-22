import '/core/utils/json_convertor.dart';
import 'address.dart';

class User {
  String username;
  String email;

  String? _password;

  DateTime? _createdAt;

  List<Address>? _addresses;

  User._(this.email, this.username, this._password, this._addresses,
      this._createdAt);

  User.create(
      {required String username,
      required String email,
      required String password,
      List<Address>? address})
      : this._(email, username, password, address, DateTime.now());

  Map<String, dynamic> get toJson => {
        'email': email,
        'password': _password,
        'name': username,
        //todo:add to user params
        "avatar": "https://picsum.photos/800",
        'address': _addresses?.map((e) => e.toJson)
      };

  //data = {_Map} size = 8
  //  0 = {map entry} "id" -> 26
  //  1 = {map entry} "email" -> "Test@gmail.com"
  //  2 = {map entry} "password" -> "12345678"
  //  3 = {map entry} "name" -> "test"
  //  4 = {map entry} "role" -> "customer"
  //  5 = {map entry} "avatar" -> "https://picsum.photos/800"
  //  6 = {map entry} "creationAt" -> "2023-12-20T11:09:21.000Z"
  //  7 = {map entry} "updatedAt" -> "2023-12-20T11:09:21.000Z"
  factory User.fromJson(Map<String, dynamic> json) {
    return User._(
        json['email'],
        json['name'],
        json['password'],
        JsonConvertor()
            .nullableIterable(json['address'], Address.fromJson)
            ?.whereType<Address>()
            .toList(),
        DateTime.tryParse(json['creationAt'].toString()));
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

  String get joinAt => _createdAt?.toIso8601String() ?? '';

  bool validCredential(String nameOrEmail, String password) {
    return _password == password &&
        (nameOrEmail == username || nameOrEmail == email);
  }
}
