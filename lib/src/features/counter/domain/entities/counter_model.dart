import 'package:equatable/equatable.dart';

class CounterModel extends Equatable {
  final int counter;

  const CounterModel(this.counter);

  @override
  List<Object?> get props => [counter];
}
