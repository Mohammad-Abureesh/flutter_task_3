import 'package:flutter/material.dart';
import 'package:flutter_task_3/app/sing_up/controllers/sing_up_screen_controller.dart';
import 'package:flutter_task_3/core/presentation/widgets/floating_text_field.dart';
import 'package:flutter_task_3/core/presentation/widgets/submit_button.dart';

class SingUpForm extends StatelessWidget {
  SingUpForm({Key? key})
      : _controller = SingUpScreenController(),
        super(key: key);

  final SingUpScreenController _controller;
  @override
  Widget build(BuildContext context) {
    const gap = SizedBox(height: 20.0);

    return Form(
      key: _controller.formKey,
      child: Column(
        children: [
          FloatingTextField(
              controller: _controller.nameController,
              label: 'Name',
              hint: 'Please enter your name'),
          gap,
          FloatingTextField(
              controller: _controller.emailController,
              label: 'Email Address',
              hint: 'e.g name@example.com'),
          gap,
          FloatingPasswordField(controller: _controller.passwordController),
          const SizedBox(height: 50.0),
          SubmitButton(
              title: 'SingUp', onPressed: () => _controller.onSubmit(context))
        ],
      ),
    );
  }
}
