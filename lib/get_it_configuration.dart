import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'get_it_configuration.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future configureDependencies() async {
  return getIt.init();
}
