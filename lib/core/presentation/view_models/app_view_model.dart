import 'dart:developer';

import 'package:clean_todo/core/presentation/view_models/view_model.dart';

class AppViewModel extends ViewModel {
  int hello = 0;

  increment() {
    hello += 1;
    notifyListeners();
  }

  @override
  onInit() {
    log("ONNN, Init World");
  }
}
