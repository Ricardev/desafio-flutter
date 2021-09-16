import 'package:get_it/get_it.dart';

import '../request_api_provider.dart';
import '../request_provider.dart';

class Injector {
  static GetIt getIt = GetIt.instance;
  static void init() {
    getIt.registerFactory<RequestProvider>(() => RequestApiProvider());
  }
}
