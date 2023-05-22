import 'package:cleanarchitecture/src/core/error/failure.dart';
import 'package:cleanarchitecture/src/features/counter/domain/entities/counter_model.dart';
import 'package:dartz/dartz.dart';

abstract class CounterRepository {
  Future<Either<Failure, CounterModel>> getCounter();
  Future<Either<Failure, CounterModel>> incrementCounter();
  Future<Either<Failure, CounterModel>> decrementCounter();
}
