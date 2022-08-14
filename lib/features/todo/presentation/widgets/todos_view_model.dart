import 'package:clean_todo/core/presentation/viewmodels/view_model.dart';

class TodosViewModel extends ViewModel {
  int count = 0;

  increment() {
    count += 1;
    notifyListeners();
  }
}
