import 'package:flutter/cupertino.dart';
import 'package:flutter_task_3/core/enums/e_app_pages.dart';
import 'package:flutter_task_3/core/utils/animated_route.dart';
import 'package:flutter_task_3/core/utils/pages_manager.dart';

class Routing {
  static final Routing _routing = Routing._();

  Routing._();
  static VoidCallback? of(BuildContext context, Widget screen) {
    if (!context.mounted) return null;
    return () async => await _routing.open(context, screen);
  }

  static void replace(BuildContext context, Widget screen) {
    of(context, screen)?.call();
  }

  static VoidCallback? fromAppPage(BuildContext context, EAppPages page) {
    return of(context, PagesManager.routeBuilder(page).call());
  }

  Future<R?> open<R>(BuildContext context, Widget screen) async {
    return await Navigator.push<R>(context, AnimatedRoute<R>.to(screen));
  }
}
