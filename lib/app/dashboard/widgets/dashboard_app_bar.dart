import 'package:flutter/material.dart';
import 'package:flutter_task_3/core/domain/repositories/products_repository.dart';
import 'package:flutter_task_3/core/enums/e_app_pages.dart';
import 'package:flutter_task_3/core/presentation/widgets/default_app_bar_state.dart';
import 'package:flutter_task_3/core/presentation/widgets/floating_text_field.dart';
import 'package:flutter_task_3/core/presentation/widgets/text_widget.dart';
import 'package:flutter_task_3/core/utils/routing.dart';

class DashboardAppBar extends DefaultAppBarState {
  const DashboardAppBar({super.key});

  @override
  Widget child(BuildContext context) {
    const gap = SizedBox(width: 20.0);

    return Row(children: [
      const Expanded(child: _SearchField()),
      gap,
      Builder(
          builder: (context) => _CartButton(
              count: ProductsRepository().numberOfItemsInCart,
              onPressed: Routing.fromAppPage(context, EAppPages.myCart))),
      gap,
      _ActionButton(
          icon: Icons.notifications_none_sharp,
          onPressed: Routing.fromAppPage(context, EAppPages.notifications))
    ]);
  }

  @override
  Size get preferredSize => const Size.fromHeight(180.0);
}

class _SearchField extends FloatingSearchField {
  const _SearchField() : super(hint: 'Search Product');
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
            heroTag: _DynamicHeroTag(icon.codePoint.toString()),
            onPressed: onPressed,
            backgroundColor: theme.scaffoldBackgroundColor,
            elevation: 5.0,
            child: Icon(icon, color: theme.primaryColor)));
  }
}

class _DynamicHeroTag {
  final String data;
  const _DynamicHeroTag(this.data);
  @override
  String toString() => '$data${DateTime.now().millisecond}';
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
