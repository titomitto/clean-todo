import 'package:clean_todo/core/injector.dart';
import 'package:clean_todo/core/presentation/app_localizations.dart';
import 'package:clean_todo/core/presentation/screens/screen.dart';
import 'package:clean_todo/features/task/presentation/screens/add_task_screen.dart';
import 'package:get_it/get_it.dart';
import 'domain/usecases/add_task.dart';
import 'domain/usecases/delete_task.dart';
import 'presentation/screens/tasks_screen.dart';
import 'presentation/translations/task_english_translations.dart';
import 'presentation/translations/task_swahili_translation.dart';
import 'presentation/viewmodels/add_task_view_model.dart';
import 'presentation/viewmodels/tasks_view_model.dart';
import 'presentation/viewmodels/tasks_list_view_model.dart';

class TodoInjector extends Injector {
  @override
  List<LocaleTranslations> get translations => [
        TasksEnglishTranslations(),
        TasksSwahiliTranslations(),
      ];

  @override
  List<Screen> get screens => [
        TasksScreen(),
        AddTaskScreen(),
      ];

  @override
  void registerUseCases() {
    GetIt.I.registerSingleton(AddTask());
    GetIt.I.registerSingleton(DeleteTodo());
  }

  @override
  void registerViewModels() {
    GetIt.I.registerFactory(() => TasksListViewModel());
    GetIt.I.registerFactory(() => TasksViewModel());
    GetIt.I.registerSingleton(AddTaskViewModel());
  }
}
