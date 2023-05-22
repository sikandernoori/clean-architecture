// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cleanarchitecture/src/features/counter/data/datasources/counter_local_data_source.dart' as _i3;
import 'package:cleanarchitecture/src/features/counter/data/reopsitories/counter_repository_impl.dart' as _i5;
import 'package:cleanarchitecture/src/features/counter/domain/repositories/counter_repository.dart' as _i4;
import 'package:cleanarchitecture/src/features/counter/domain/usecases/decrement_counter_use_case.dart' as _i6;
import 'package:cleanarchitecture/src/features/counter/domain/usecases/get_counter_use_case.dart' as _i7;
import 'package:cleanarchitecture/src/features/counter/domain/usecases/increment_counter_use_case.dart' as _i8;
import 'package:cleanarchitecture/src/features/counter/presentation/bloc/counter_bloc.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.CounterLocalDataSource>(_i3.CounterLocalDataSource());
    gh.factory<_i4.CounterRepository>(() => _i5.CounterRepositoryImpl(gh<_i3.CounterLocalDataSource>()));
    gh.factory<_i6.DecrementCounterUseCase>(() => _i6.DecrementCounterUseCase(gh<_i4.CounterRepository>()));
    gh.factory<_i7.GetCounterUseCase>(() => _i7.GetCounterUseCase(gh<_i4.CounterRepository>()));
    gh.factory<_i8.IncrementCounterUseCase>(() => _i8.IncrementCounterUseCase(gh<_i4.CounterRepository>()));
    gh.factory<_i9.CounterBloc>(() => _i9.CounterBloc(
          getCounterUseCase: gh<_i7.GetCounterUseCase>(),
          incrementCounterUseCase: gh<_i8.IncrementCounterUseCase>(),
          decrementCounterUseCase: gh<_i6.DecrementCounterUseCase>(),
        ));
    return this;
  }
}
