class User {
  String username;
  String email;

  String? _password;

  User._(this.email, this.username, this._password);
  User.create(
      {required String username,
      required String email,
      required String password})
      : this._(email, username, password);

  Map<String, dynamic> get toJson =>
      {'email': email, 'password': _password, 'username': username};

  @override
  bool operator ==(Object other) {
    if (other is! User) return false;
    return other.hashCode == hashCode &&
        email == other.email &&
        username == other.username;
  }

  @override
  int get hashCode => username.hashCode ^ email.hashCode;
}
