import 'package:flutter_task_3/core/constants/apis_routes.dart';
import 'package:flutter_task_3/core/domain/entities/login_request.dart';
import 'package:flutter_task_3/core/domain/entities/login_response.dart';
import 'package:flutter_task_3/core/domain/entities/user.dart';
import 'package:flutter_task_3/core/domain/gateway/apis_handler/apis_manager.dart';

class UserGateway extends ApisManager {
  Future<bool> singUp(User user) async {
    return (await post(ApisRoutes.createUser, data: user.toJson)).success;
  }

  Future<LoginResponse> login(LoginRequest request) async {
    return (await post(ApisRoutes.login,
            data: request.toJson, convertor: LoginResponse.fromJson))
        .dataOrDefault(LoginResponse.failed());
  }

  Future<User?> userProfile(String? token) async {
    if (token == null) return null;
    ApiTokenService.addTokenToDioOptions();
    return (await get(ApisRoutes.profile, User.fromJson)).data;
  }
}
