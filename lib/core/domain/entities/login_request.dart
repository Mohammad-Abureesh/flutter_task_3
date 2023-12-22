class LoginRequest {
  final String nameOrEmail;
  final String password;

  LoginRequest(this.nameOrEmail, this.password);

  Map<String, dynamic> get toJson =>
      {'email': nameOrEmail, 'password': password};
}
