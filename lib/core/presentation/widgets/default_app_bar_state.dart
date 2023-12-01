import 'package:flutter/cupertino.dart';

abstract class DefaultAppBarState extends StatelessWidget
    implements PreferredSizeWidget {
  final EdgeInsets? padding;

  const DefaultAppBarState({super.key, this.padding});

  Widget child(BuildContext context);

  @override
  Widget build(BuildContext context) {
    const double lRPadding = 20.0;

    return SafeArea(
        child: Padding(
            padding: padding ??
                const EdgeInsets.only(
                    top: 15.0, left: lRPadding, right: lRPadding),
            child: child(context)));
  }
}
