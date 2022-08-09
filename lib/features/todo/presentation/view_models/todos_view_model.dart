import 'dart:developer';

import 'package:clean_todo/core/presentation/view_models/view_model.dart';
import 'package:clean_todo/core/utils/service_locator.dart';
import 'package:clean_todo/features/todo/domain/usecases/add_count.dart';
import 'package:clean_todo/features/todo/domain/usecases/increment_count.dart';

class TodosViewModel extends ViewModel {
  int count = 0;

  increment() {
    var addCount = getIt<AddCount>();
    count = addCount(AddCountParams(
      count: count,
    ));

    notifyListeners();
  }

  decrement() {
    var addCount = getIt<DecrementCount>();
    count = addCount(DecrementCountParams(
      count: count,
    ));

    notifyListeners();
  }
}
