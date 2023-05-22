import 'package:cleanarchitecture/src/core/error/failure.dart';
import 'package:cleanarchitecture/src/features/counter/domain/entities/counter_model.dart';
import 'package:cleanarchitecture/src/features/counter/domain/repositories/counter_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class DecrementCounterUseCase {
  final CounterRepository _repository;

  DecrementCounterUseCase(this._repository);

  Future<Either<Failure, CounterModel>> call() async {
    return await _repository.decrementCounter();
  }
}
