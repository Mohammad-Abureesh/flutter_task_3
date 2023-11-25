import 'package:flutter/material.dart';

enum SocialLogin {
  google(Icons.g_mobiledata_outlined),
  facebook(Icons.facebook);

  const SocialLogin(this.icon);

  final IconData icon;
}

class SocialLoginButtons extends StatelessWidget {
  const SocialLoginButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: SocialLogin.values.map(_SocialButton.fromMethod).toList(),
    );
  }
}

class _SocialButton extends StatelessWidget {
  final SocialLogin value;

  const _SocialButton.fromMethod(this.value);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        child: Icon(value.icon));
  }
}
