import 'package:cleanarchitecture/src/features/counter/domain/entities/counter_model.dart';
import 'package:cleanarchitecture/src/features/counter/domain/usecases/decrement_counter_use_case.dart';
import 'package:cleanarchitecture/src/features/counter/domain/usecases/get_counter_use_case.dart';
import 'package:cleanarchitecture/src/features/counter/domain/usecases/increment_counter_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

@injectable
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  final GetCounterUseCase getCounterUseCase;
  final IncrementCounterUseCase incrementCounterUseCase;
  final DecrementCounterUseCase decrementCounterUseCase;

  CounterBloc({
    required this.getCounterUseCase,
    required this.incrementCounterUseCase,
    required this.decrementCounterUseCase,
  }) : super(CounterEmptyState()) {
    on<GetCounterEvent>(_onGetCounterEvent);
    on<CounterIncrementEvent>(_onCounterIncrementEvent);
    on<CounterDecrementEvent>(_onCounterDecrementEvent);
  }

  void _onGetCounterEvent(
    GetCounterEvent event,
    Emitter<CounterState> emit,
  ) async {
    emit(CounterLoadingState());
    final result = await getCounterUseCase.call();

    result.fold(
      (failure) => emit(CounterErrorState()),
      (counter) => emit(CounterSuccessState(counter)),
    );
  }

  void _onCounterIncrementEvent(
    CounterIncrementEvent event,
    Emitter<CounterState> emit,
  ) async {
    emit(CounterLoadingState());
    await _delay();
    final result = await incrementCounterUseCase.call();

    result.fold(
      (failure) => emit(CounterErrorState()),
      (counter) => emit(CounterSuccessState(counter)),
    );
  }

  void _onCounterDecrementEvent(
    CounterDecrementEvent event,
    Emitter<CounterState> emit,
  ) async {
    emit(CounterLoadingState());
    await _delay();
    final result = await decrementCounterUseCase.call();

    result.fold(
      (failure) => emit(CounterErrorState()),
      (counter) => emit(CounterSuccessState(counter)),
    );
  }

  _delay() async => await Future.delayed(const Duration(milliseconds: 500));
}
