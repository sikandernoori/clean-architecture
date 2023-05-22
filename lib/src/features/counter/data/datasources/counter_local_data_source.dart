import 'package:cleanarchitecture/src/core/error/exception.dart';
import 'package:cleanarchitecture/src/features/counter/domain/entities/counter_model.dart';
import 'package:injectable/injectable.dart';

@singleton
class CounterLocalDataSource {
  CounterLocalDataSource();

  int counter = 0;

  Future<CounterModel> getCounter() async {
    try {
      return CounterModel(counter);
    } on Exception catch (_) {
      rethrow;
    }
  }

  Future<CounterModel> incrementCounter() async {
    try {
      counter++;
      return CounterModel(counter);
    } on Exception catch (_) {
      throw ArithemeticException();
    }
  }

  Future<CounterModel> decrementCounter() async {
    try {
      counter--;
      return CounterModel(counter);
    } on Exception catch (_) {
      throw ArithemeticException();
    }
  }
}
