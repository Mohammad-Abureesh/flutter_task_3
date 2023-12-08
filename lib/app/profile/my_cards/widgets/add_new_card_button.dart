import 'package:flutter/material.dart';

class AddNewCardButton extends StatelessWidget {
  final ValueChanged<BuildContext> onAdd;
  const AddNewCardButton(this.onAdd, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          onAdd.call(context);
        },
        icon: const Icon(Icons.add));
  }
}
