import 'package:flutter/material.dart';

class DefaultAppBar extends AppBar {
  DefaultAppBar({Key? key})
      : super(
            key: key,
            elevation: 0.0,
            leading: const BackButton(),
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.black);
}
