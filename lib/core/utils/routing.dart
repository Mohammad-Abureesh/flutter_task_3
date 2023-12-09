import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_task_3/core/enums/e_app_pages.dart';
import 'package:flutter_task_3/core/utils/animated_route.dart';
import 'package:flutter_task_3/core/utils/pages_manager.dart';

class Routing {
  static final Routing _routing = Routing._();

  Routing._();
  static AsyncCallback? of(BuildContext context, Widget screen) {
    if (!context.mounted) return null;
    return () async => await _routing.open(context, screen);
  }

  static void replace<R>(BuildContext context, Widget screen) {
    Navigator.pushReplacement(context, AnimatedRoute<R>.to(screen));
  }

  static void replaceFromAppPage(BuildContext context, EAppPages page) {
    replace(context, PagesManager.routeBuilder(page).call());
  }

  static AsyncCallback? fromAppPage(BuildContext context, EAppPages page) {
    return of(context, PagesManager.routeBuilder(page).call());
  }

  Future<R?> open<R>(BuildContext context, Widget screen) async {
    return await Navigator.push<R>(context, AnimatedRoute<R>.to(screen));
  }
}
