import 'package:flutter/material.dart';
import 'package:flutter_task_3/app/login/controllers/login_screen_controller.dart';
import 'package:flutter_task_3/core/presentation/widgets/floating_text_field.dart';
import 'package:flutter_task_3/core/presentation/widgets/submit_button.dart';
import 'package:flutter_task_3/core/presentation/widgets/text_widget.dart';

class LoginForm extends StatelessWidget {
  LoginForm({Key? key})
      : _controller = LoginScreenController(),
        super(key: key);

  final LoginScreenController _controller;
  @override
  Widget build(BuildContext context) {
    const gap = SizedBox(height: 20.0);

    return Form(
      key: _controller.formKey,
      child: Column(
        children: [
          FloatingTextField(
              controller: _controller.emailController,
              label: 'Email Address',
              hint: 'e.g name@example.com'),
          gap,
          FloatingPasswordField(controller: _controller.passwordController),
          gap,
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Expanded(
                child: _RememberMe(onChanged: _controller.onRememberChanged)),
            _ForgetPassword(onPressed: _controller.onForgetPassword)
          ]),
          gap,
          gap,
          SubmitButton(
              title: 'Login',
              onPressed: () {
                _controller.onSubmit(context);
              })
        ],
      ),
    );
  }
}

class _RememberMe extends StatefulWidget {
  final ValueChanged<bool?> onChanged;
  const _RememberMe({required this.onChanged});

  @override
  State<_RememberMe> createState() => _RememberMeState();
}

class _RememberMeState extends State<_RememberMe> {
  bool state = false;
  @override
  Widget build(BuildContext context) {
    return ListTileTheme(
      horizontalTitleGap: 0.0,
      child: CheckboxListTile(
          value: state,
          activeColor: Theme.of(context).primaryColor,
          controlAffinity: ListTileControlAffinity.leading,
          contentPadding: EdgeInsets.zero,
          title: TextWidget(
              data: 'Remember me', color: Theme.of(context).hintColor),
          onChanged: onChanged),
    );
  }

  void onChanged(bool? value) {
    widget.onChanged.call(value);
    state = value ?? false;
    setState(() {});
  }
}

class _ForgetPassword extends StatelessWidget {
  final VoidCallback? onPressed;
  const _ForgetPassword({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: TextWidget(
            data: 'Forget password', color: Theme.of(context).hintColor));
  }
}
