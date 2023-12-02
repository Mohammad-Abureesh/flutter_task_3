import 'package:flutter/material.dart';

//TODO: add more animation options
class AnimatedRoute<R> extends PageRouteBuilder<R> {
  AnimatedRoute.to(Widget screen)
      : super(
            pageBuilder: (BuildContext context, Animation<double> animation,
                    Animation<double> secAnim) =>
                screen,
            transitionDuration: const Duration(milliseconds: 600),
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secAnimation,
                Widget child) {
              return SlideTransition(
                  position: animation.drive(
                      Tween(begin: const Offset(-1, 0), end: Offset.zero)),
                  child: child);
            });
}
