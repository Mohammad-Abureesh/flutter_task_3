import 'package:flutter/cupertino.dart';
import 'package:flutter_task_3/core/utils/animated_route.dart';

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

  Future<R?> open<R>(BuildContext context, Widget screen) async {
    return await Navigator.push<R>(context, AnimatedRoute<R>.to(screen));
  }
}
