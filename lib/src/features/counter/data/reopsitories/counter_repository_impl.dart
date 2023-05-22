import 'package:cleanarchitecture/src/core/error/exception.dart';
import 'package:cleanarchitecture/src/core/error/failure.dart';
import 'package:cleanarchitecture/src/features/counter/data/datasources/counter_local_data_source.dart';
import 'package:cleanarchitecture/src/features/counter/domain/entities/counter_model.dart';
import 'package:cleanarchitecture/src/features/counter/domain/repositories/counter_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CounterRepository)
class CounterRepositoryImpl extends CounterRepository {
  final CounterLocalDataSource _localDataSource;

  CounterRepositoryImpl(this._localDataSource);

  @override
  Future<Either<Failure, CounterModel>> getCounter() async {
    try {
      return Right(await _localDataSource.getCounter());
    } on ArithemeticException {
      return Left(ArithemeticFailure());
    } on Exception {
      return Left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, CounterModel>> incrementCounter() async {
    try {
      return Right(await _localDataSource.incrementCounter());
    } on ArithemeticException {
      return Left(ArithemeticFailure());
    } on Exception {
      return Left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, CounterModel>> decrementCounter() async {
    try {
      return Right(await _localDataSource.decrementCounter());
    } on Exception {
      return Left(UnknownFailure());
    }
  }
}
