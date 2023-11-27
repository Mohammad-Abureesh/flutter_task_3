import 'package:flutter/material.dart';
import 'package:flutter_task_3/core/presentation/widgets/floating_text_field.dart';

class DashboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DashboardAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Row(
          children: [
            Expanded(
                child: FloatingTextField(
              hint: 'Search Product',
              prefixIcon:
                  Icon(Icons.search, color: Theme.of(context).primaryColor),
            )),
            const IconButton(icon: Icon(Icons.shopping_cart), onPressed: null),
            const IconButton(
                icon: Icon(Icons.notification_important), onPressed: null),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(180.0);
}
