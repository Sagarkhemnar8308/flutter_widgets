import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget/counter/counter_bloc.dart';
import 'package:shader_text/my_package.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  void initState() {
    context.read<CounterBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => context.read<CounterBloc>().add(IncrementCounterEvent()),
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () => context.read<CounterBloc>().add(DecrementCounterEvent()),
            child: const Icon(Icons.remove),
          ),
        ],
      ),
      body: BlocConsumer<CounterBloc, CounterState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is CounterErrorState) {
            return Text('An error occurred: ${state.error}');
          }
          if (state is CounterLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is CounterLoadedState) {
            return Center(child: Text('Current Counter: ${state.counter}'));
          }
          return  const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ShaderWidget(gradientColor: [Colors.orange,Colors.pink], text: "Sagar",)
            ],
          );
        },
      ),
    );
  }
}
