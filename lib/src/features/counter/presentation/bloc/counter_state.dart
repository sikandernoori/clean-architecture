part of 'counter_bloc.dart';

abstract class CounterState {}

class CounterEmptyState extends CounterState {}

class CounterLoadingState extends CounterState {}

class CounterSuccessState extends CounterState {
  final CounterModel counterModel;

  CounterSuccessState(this.counterModel);
}

class CounterErrorState extends CounterState {}
