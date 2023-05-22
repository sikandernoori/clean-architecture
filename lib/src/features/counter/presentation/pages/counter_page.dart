import 'package:cleanarchitecture/src/common/app_keys.dart';
import 'package:cleanarchitecture/src/features/counter/presentation/bloc/counter_bloc.dart';
import 'package:cleanarchitecture/src/features/counter/presentation/models/counter_type.dart';
import 'package:cleanarchitecture/src/features/counter/presentation/widgets/counter_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Clean Architecture with Bloc 101')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height / 2.7),
            const Text('You have pushed the button this many times:'),
            const SizedBox(height: 10),
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                if (state is CounterLoadingState) {
                  return const CircularProgressIndicator(key: AppKeys.loadingWidget);
                } else if (state is CounterErrorState) {
                  return Text(
                    'Something went wrong',
                    key: AppKeys.errorWidget,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.red),
                  );
                } else if (state is CounterSuccessState) {
                  return Text(
                    '${state.counterModel.counter}',
                    key: AppKeys.counterWidget,
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButton: const Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CounterButton(
            key: AppKeys.incrementButton,
            counterType: CounterType.increment,
          ),
          SizedBox(width: 16),
          CounterButton(
            key: AppKeys.decrementButton,
            counterType: CounterType.decrement,
          ),
        ],
      ),
    );
  }
}
