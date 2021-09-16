import 'package:get_it/get_it.dart';

import '../request_provider.dart';
import '../i_request_provider.dart';

class Injector {
  static GetIt getIt = GetIt.instance;
  static void init() {
    getIt.registerFactory<IRequestProvider>(() => RequestProvider());
  }
}
