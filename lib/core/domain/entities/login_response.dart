class LoginResponse {
  String? accessToken;
  String? refreshToken;

  LoginResponse(this.accessToken, this.refreshToken);

  LoginResponse.failed();

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(json['access_token'], json['refresh_token']);
  }
}
