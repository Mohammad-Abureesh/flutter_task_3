import 'package:flutter/material.dart';
import 'package:flutter_task_3/app/login/screens/login_screen.dart';
import 'package:flutter_task_3/app/sing_up/screens/sign_up_screen.dart';
import 'package:flutter_task_3/core/presentation/widgets/text_widget.dart';

class AskUserTo extends StatelessWidget {
  final String _message;
  final String _submitText;

  final ValueChanged<BuildContext>? onPressed;

  const AskUserTo._(this._message, this._submitText, this.onPressed,
      {super.key});

  AskUserTo.signIn({Key? key, ValueChanged<BuildContext>? onPressed})
      : this._(
            'Already have an account?',
            'Sign in',
            (context) => Navigator.pushReplacement(
                context, _AnimatedRoute(builder: () => const LoginScreen())),
            key: key);

  AskUserTo.signUp({
    Key? key,
  }) : this._(
            'Don\'t have an account?',
            'Sign Up',
            (context) => Navigator.push(
                context, _AnimatedRoute(builder: () => const SignUpScreen())),
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

class _AnimatedRoute extends PageRouteBuilder {
  _AnimatedRoute({required Widget Function() builder})
      : super(
            pageBuilder: (context, animation, secAnim) => builder.call(),
            transitionDuration: const Duration(milliseconds: 600),
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secAnimation,
                Widget child) {
              return SlideTransition(
                  position: animation.drive(
                      Tween(begin: const Offset(-1, 0), end: Offset.zero)),
                  child: child);
            });
}
