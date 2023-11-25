import 'package:flutter/material.dart';
import 'package:flutter_task_3/core/presentation/widgets/text_widget.dart';

class AskUserTo extends StatelessWidget {
  final String _message;
  final String _submitText;

  final VoidCallback? onPressed;

  const AskUserTo._(this._message, this._submitText, this.onPressed,
      {super.key});

  const AskUserTo.signIn({Key? key, VoidCallback? onPressed})
      : this._('Already have an account?', 'Sign in', onPressed, key: key);

  const AskUserTo.signUp({Key? key, VoidCallback? onPressed})
      : this._('Don\'t have an account?', 'Sign Up', onPressed, key: key);
  const AskUserTo.resendVerification({Key? key, VoidCallback? onPressed})
      : this._('Don\'t get a code?', 'Send again', onPressed, key: key);
  @override
  Widget build(BuildContext context) =>
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(_message),
        TextButton(
            onPressed: onPressed,
            child: TextWidget(
              data: _submitText,
              color: Theme.of(context).primaryColor,
            ))
      ]);
}
