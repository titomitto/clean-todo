import 'package:clean_todo/core/injector.dart';
import 'package:clean_todo/core/presentation/screens/screen.dart';
import 'package:clean_todo/core/utils/service_locator.dart';
import 'package:clean_todo/features/todo/domain/usecases/add_count.dart';
import 'package:clean_todo/features/todo/presentation/view_models/add_todo_view_model.dart';
import 'domain/usecases/increment_count.dart';
import 'presentation/screens/todos_screen.dart';
import 'presentation/view_models/todos_view_model.dart';

class TodoInjector extends Injector {
  @override
  List<Screen> get screens => [
        TodosScreen(),
      ];

  @override
  void registerUseCases() {
    getIt.registerSingleton(AddTodo());
    getIt.registerSingleton(DeleteTodo());
  }

  @override
  void registerViewModels() {
    getIt.registerFactory(() => TodoListViewModel());
    getIt.registerSingleton(AddTodoViewModel());
  }
}
