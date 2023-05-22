import 'package:cleanarchitecture/src/features/counter/presentation/bloc/counter_bloc.dart';
import 'package:cleanarchitecture/src/features/counter/presentation/models/counter_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterButton extends StatelessWidget {
  const CounterButton({Key? key, required this.counterType}) : super(key: key);
  final CounterType counterType;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => _onPressed(context),
      tooltip: counterType.name,
      child: _getCounterWidget,
    );
  }

  void _onPressed(BuildContext context) =>
      context.read<CounterBloc>().add(counterType == CounterType.increment ? CounterIncrementEvent() : CounterDecrementEvent());

  Widget get _getCounterWidget => Icon(counterType == CounterType.increment ? Icons.add : Icons.remove);
}
