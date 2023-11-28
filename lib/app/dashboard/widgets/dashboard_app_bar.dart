import 'package:flutter/material.dart';
import 'package:flutter_task_3/core/presentation/widgets/floating_text_field.dart';
import 'package:flutter_task_3/core/presentation/widgets/text_widget.dart';

class DashboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DashboardAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    const double lRPadding = 20.0;
    const gap = SizedBox(width: 20.0);

    return const SafeArea(
        child: Padding(
            padding: EdgeInsets.only(
              top: 15.0,
              left: lRPadding,
              right: lRPadding,
            ),
            child: Row(
              children: [
                _SearchField(),
                gap,
                _CartButton(count: 5),
                gap,
                _ActionButton(icon: Icons.notifications_none_sharp),
              ],
            )));
  }

  @override
  Size get preferredSize => const Size.fromHeight(180.0);
}

class _SearchField extends StatelessWidget {
  const _SearchField();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FloatingTextField(
          textAlignVertical: TextAlignVertical.center,
          hint: 'Search Product',
          radius: 25.0,
          prefixIcon: Icon(
            Icons.search,
            color: Theme.of(context).primaryColor,
          )),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  const _ActionButton({this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox.square(
        dimension: 35.0,
        child: FloatingActionButton(
            onPressed: onPressed,
            backgroundColor: theme.scaffoldBackgroundColor,
            elevation: 5.0,
            child: Icon(icon, color: theme.primaryColor)));
  }
}

class _CartButton extends _ActionButton {
  final int count;

  const _CartButton({
    this.count = 0,
    VoidCallback? onPressed,
  }) : super(icon: Icons.shopping_cart_outlined, onPressed: onPressed);

  @override
  Widget build(BuildContext context) {
    return Badge(
        backgroundColor: Theme.of(context).primaryColor,
        smallSize: 10.0,
        label: TextWidget(data: '$count', color: Colors.white),
        child: super.build(context));
  }
}
