import 'package:flutter/material.dart';

import '/app/profile/my_cards/controllers/add_card_screen_controller.dart';
import '/core/presentation/formatters/app_inputs_formatters.dart';
import '/core/presentation/widgets/floating_text_field.dart';
import '/core/presentation/widgets/submit_button.dart';
import '/core/presentation/widgets/text_widget.dart';

class AddNewCardScreenBody extends StatefulWidget {
  const AddNewCardScreenBody({Key? key}) : super(key: key);

  @override
  State<AddNewCardScreenBody> createState() => _AddNewCardScreenBodyState();
}

class _AddNewCardScreenBodyState extends State<AddNewCardScreenBody> {
  _AddNewCardScreenBodyState() : _controller = AddCardScreenController();

  final AddCardScreenController _controller;
  @override
  void initState() {
    _controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const SizedBox gap = SizedBox(height: 20.0);
    return Form(
        key: _controller.formKey,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const TextWidget(data: 'Payment Method', size: 18.0),
                Icon(_controller.method.icon)
              ]),
              const Divider(),
              gap,
              FloatingTextField(
                  label: 'Bank Name',
                  controller: _controller.bankName,
                  validator: _controller.defaultValidator),
              gap,
              FloatingTextField(
                  label: 'Card holder Name',
                  controller: _controller.holderName,
                  inputFormatters: [CardHolderNameFormatter()],
                  validator: _controller.defaultValidator),
              gap,
              FloatingTextField(
                  label: 'Card number',
                  controller: _controller.cardNumber,
                  maxLength: 19,
                  counterText: '',
                  inputFormatters: [CardNumberFormatter()],
                  validateMode: AutovalidateMode.onUserInteraction,
                  validator: _controller.cardNumberValidator),
              gap,
              FloatingTextField(
                  label: 'Expiry Date',
                  controller: _controller.expiry,
                  inputFormatters: [ExpiryDateFormatter()],
                  validator: _controller.defaultValidator),
              gap,
              gap,
              SubmitButton(title: 'Add card', onPressed: _controller.onAdd)
            ],
          ),
        ));
  }
}
