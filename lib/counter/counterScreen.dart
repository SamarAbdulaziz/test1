import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/counter/CounterCubit/counter_cubit.dart';
import 'package:test1/counter/CounterCubit/counter_state.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<CounterCubit,CounterStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    CounterCubit.get(context).increment();
                  },
                  child: const Text('plus'),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Text(
                  '${CounterCubit
                      .get(context)
                      .counter}',
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                FloatingActionButton(
                  onPressed: () {
                    CounterCubit.get(context).decrement();
                  },
                  child: const Text('minus'),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
