class User {
  String username;
  String email;

  String? _password;

  DateTime _createdAt;
  User._(this.email, this.username, this._password)
      : _createdAt = DateTime.now();
  User.create(
      {required String username,
      required String email,
      required String password})
      : this._(email, username, password);

  Map<String, dynamic> get toJson =>
      {'email': email, 'password': _password, 'username': username};

  factory User.fromJson(Map<String, dynamic> json) {
    return User._(json['email'], json['username'], json['password']);
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

  String get joinAt => _createdAt.toIso8601String();

  bool validCredential(String nameOrEmail, String password) {
    return _password == password &&
        (nameOrEmail == username || nameOrEmail == email);
  }
}
