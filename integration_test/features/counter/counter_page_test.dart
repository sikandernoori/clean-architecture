import 'package:cleanarchitecture/app.dart';
import 'package:cleanarchitecture/src/common/app_keys.dart';
import 'package:cleanarchitecture/src/core/error/failure.dart';
import 'package:cleanarchitecture/src/features/counter/domain/entities/counter_model.dart';
import 'package:cleanarchitecture/src/features/counter/domain/usecases/decrement_counter_use_case.dart';
import 'package:cleanarchitecture/src/features/counter/domain/usecases/get_counter_use_case.dart';
import 'package:cleanarchitecture/src/features/counter/domain/usecases/increment_counter_use_case.dart';
import 'package:cleanarchitecture/src/features/counter/presentation/bloc/counter_bloc.dart';
import 'package:cleanarchitecture/src/features/counter/presentation/pages/counter_page.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'counter_page_test.mocks.dart';

@GenerateMocks([
  GetCounterUseCase,
  IncrementCounterUseCase,
  DecrementCounterUseCase,
])
Future<void> main() async {
  int counter = 0;
  late GetCounterUseCase getCounterUseCase;
  late IncrementCounterUseCase incrementCounterUseCase;
  late DecrementCounterUseCase decrementCounterUseCase;

  late CounterBloc counterBloc;

  Future<void> setupDependencyInjection() async {
    await GetIt.I.reset();
    GetIt.I.registerSingleton<CounterBloc>(counterBloc);
  }

  // Prepare all dependencies that need to be initialized/recreated before every single test runs
  setUp(() async {
    // Initialize required blocs

    counterBloc = CounterBloc(
      getCounterUseCase: getCounterUseCase,
      incrementCounterUseCase: incrementCounterUseCase,
      decrementCounterUseCase: decrementCounterUseCase,
    );

    await setupDependencyInjection();
  });

  // Prepare all dependencies and tested widget to integration test
  setUpAll(() async {
    // Initialize required use_cases
    getCounterUseCase = MockGetCounterUseCase();
    incrementCounterUseCase = MockIncrementCounterUseCase();
    decrementCounterUseCase = MockDecrementCounterUseCase();

    when(getCounterUseCase.call()).thenAnswer((_) async => Right(CounterModel(counter)));
    when(incrementCounterUseCase.call()).thenAnswer((_) async => Right(CounterModel(counter)));
    when(decrementCounterUseCase.call()).thenAnswer((_) async => Right(CounterModel(counter)));
  });

  void verifyCounter(WidgetTester tester, int counter) {
    expect((tester.firstWidget(find.byKey(AppKeys.counterWidget)) as Text).data, '$counter');
  }

  group('Test Counter feature', () {
    testWidgets("Increment - Decrement - Loading", (tester) async {
      await tester.pumpWidget(const App());
      await tester.pumpAndSettle();

      expect(find.byType(CounterPage), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.byKey(AppKeys.incrementButton), findsOneWidget);
      expect(find.byKey(AppKeys.decrementButton), findsOneWidget);
      verifyCounter(tester, 0);

      for (int i = 1; i < 10; i++) {
        counter = i;
        await tester.tap(find.byKey(AppKeys.incrementButton));
        await tester.pump();
        expect(find.byKey(AppKeys.loadingWidget), findsOneWidget);
        await tester.pumpAndSettle();

        verifyCounter(tester, i);
      }

      for (int i = 10; i > -1; i--) {
        counter = i;
        await tester.tap(find.byKey(AppKeys.decrementButton));
        await tester.pump();
        expect(find.byKey(AppKeys.loadingWidget), findsOneWidget);
        await tester.pumpAndSettle();

        verifyCounter(tester, i);
      }
    });

    testWidgets("Failure", (tester) async {
      when(getCounterUseCase.call()).thenAnswer((_) async => Left(UnknownFailure()));
      await tester.pumpWidget(const App());
      await tester.pumpAndSettle();

      expect(find.byKey(AppKeys.errorWidget), findsOneWidget);
    });
  });
}
