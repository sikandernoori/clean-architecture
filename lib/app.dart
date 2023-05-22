import 'package:cleanarchitecture/get_it_configuration.dart';
import 'package:cleanarchitecture/src/features/counter/presentation/bloc/counter_bloc.dart';
import 'package:cleanarchitecture/src/features/counter/presentation/pages/counter_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Clean Architecture Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: BlocProvider(
          create: (context) {
            final bloc = getIt.get<CounterBloc>();
            bloc.add(GetCounterEvent());

            return bloc;
          },
          child: const CounterPage(),
        ));
  }
}
