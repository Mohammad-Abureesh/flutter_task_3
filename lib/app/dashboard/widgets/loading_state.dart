import 'package:flutter/material.dart';

class FutureLoadingState extends StatelessWidget {
  final Future<void> Function() onInit;
  final Widget Function(BuildContext context) builder;

  const FutureLoadingState(
      {Key? key, required this.onInit, required this.builder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: onInit.call(),
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) =>
            switch (snapshot.connectionState) {
              ConnectionState.done => builder.call(context),
              _ => const CircularProgressIndicator()
            });
  }
}
