import 'package:clean_todo/core/presentation/app.dart';
import 'package:get_it/get_it.dart';

import 'injector.dart';

class CoreInjector extends Injector {
  @override
  Future<void> registerViewModels(GetIt sl) async {
    sl.registerFactory(() => AppViewModel());
  }
}
