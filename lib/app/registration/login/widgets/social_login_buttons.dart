import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum SocialLogin {
  google(FontAwesomeIcons.google),
  facebook(FontAwesomeIcons.facebookF);

  const SocialLogin(this.icon);

  final IconData icon;

  Color? get iconColor => switch (this) { google => Colors.red, _ => null };
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
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Material(
        elevation: 4.0,
        borderRadius: BorderRadius.circular(30.0),
        child: CircleAvatar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            child: Icon(value.icon, color: value.iconColor)),
      ),
    );
  }
}
