import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task_3/test/counter_app/counter_cubit.dart';
import 'package:flutter_task_3/test/counter_app/counter_states.dart';

class CounterApp extends StatelessWidget {
  const CounterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BlocBuilder<CounterCubit, CounterState>(
                builder: (context, state) => Icon(
                    switch (state) {
                      InitState() => Icons.lock,
                      WaitingState() => Icons.circle_outlined,
                      ConnectionErrorState() => Icons.error,
                      SuccessState() => Icons.check
                    },
                    size: 50.0)),
            OutlinedButton(
                onPressed: context.read<CounterCubit>().toggleState,
                child: const Text('Toggle'))
          ],
        ),
      ),
    );
  }
}
