import 'dart:async';
import 'dart:developer';

import 'package:cleanarchitecture/app.dart';
import 'package:flutter/material.dart';

import 'get_it_configuration.dart';

void main() {
  runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      await configureDependencies();
      runApp(const App());
    },
    (error, stack) => log('Crash report', error: error, stackTrace: stack),
  );
}
