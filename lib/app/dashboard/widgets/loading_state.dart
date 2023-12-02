import 'package:flutter/material.dart';

abstract class FutureLoadingState extends StatefulWidget {
  const FutureLoadingState({Key? key}) : super(key: key);

  @override
  State<FutureLoadingState> createState() => _FutureLoadingStateState();

  Widget build(BuildContext context);

  Future<void> onInit();
}

class _FutureLoadingStateState extends State<FutureLoadingState> {
  bool loading = true;

  @override
  void initState() {
    super.initState();
    widget.onInit().then((value) {
      _updateLoadingState = false;
    });
  }

  set _updateLoadingState(bool value) {
    if (!mounted) return;
    loading = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (loading) return const CircularProgressIndicator();
    return widget.build(context);
  }
}
