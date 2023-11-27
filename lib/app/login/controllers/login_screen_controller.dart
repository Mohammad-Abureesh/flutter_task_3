import 'register_form_controller.dart';

class LoginScreenController extends RegisterFormController {
  bool rememberMe;

  LoginScreenController() : rememberMe = false;

  void onRememberChanged(bool? value) {
    rememberMe = value ?? false;
  }

  void onForgetPassword() {}

  @override
  void onSubmit() {
    // TODO: implement onSubmit
  }
}
