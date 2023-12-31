import 'package:flutter/material.dart';

import '/app/registration/sing_up/screens/sign_up_screen.dart';
import '/core/presentation/widgets/text_widget.dart';
import '/core/utils/routing.dart';

class AskUserTo extends StatelessWidget {
  final String _message;
  final String _submitText;

  final ValueChanged<BuildContext>? onPressed;

  const AskUserTo._(this._message, this._submitText, this.onPressed,
      {super.key});

  AskUserTo.signIn({Key? key, ValueChanged<BuildContext>? onPressed})
      : this._('Already have an account?', 'Sign in',
            (context) => Navigator.pop(context),
            key: key);

  AskUserTo.signUp({
    Key? key,
  }) : this._('Don\'t have an account?', 'Sign Up',
            (context) => Routing.of(context, const SignUpScreen())?.call(),
            key: key);

  const AskUserTo.resendVerification(
      {Key? key, ValueChanged<BuildContext>? onPressed})
      : this._('Don\'t get a code?', 'Send again', onPressed, key: key);
  @override
  Widget build(BuildContext context) {
    void onPressed() {
      this.onPressed?.call(context);
    }

    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(_message),
      TextButton(
          onPressed: onPressed,
          child: TextWidget(
            data: _submitText,
            color: Theme.of(context).primaryColor,
          ))
    ]);
  }
}
