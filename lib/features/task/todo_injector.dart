import 'package:clean_todo/core/injector.dart';
import 'package:clean_todo/core/presentation/app_localizations.dart';
import 'package:clean_todo/core/presentation/screens/screen.dart';
import 'package:clean_todo/features/task/data/datasources/tasks_local_datasource.dart';
import 'package:clean_todo/features/task/data/repositories/task_repository_impl.dart';
import 'package:clean_todo/features/task/domain/repositories/task_repository.dart';
import 'package:clean_todo/features/task/presentation/screens/add_task_screen.dart';
import 'package:get_it/get_it.dart';
import 'domain/usecases/add_task.dart';
import 'domain/usecases/delete_task.dart';
import 'presentation/screens/tasks_screen.dart';
import 'presentation/task_translations.dart';
import 'presentation/viewmodels/add_task_view_model.dart';
import 'presentation/viewmodels/tasks_view_model.dart';
import 'presentation/viewmodels/tasks_list_view_model.dart';

class TodoInjector extends Injector {
  @override
  List<LocaleTranslations> get translations => [
        TasksEnTranslations(),
        TasksSwTranslations(),
      ];

  @override
  List<Screen> get screens => [
        TasksScreen(),
        AddTaskScreen(),
      ];

  @override
  void registerDataSources() {
    sl.registerSingletonAsync<TasksLocalDataSource>(
      () => TasksLocalDataSourceImpl().init(),
    );
  }

  @override
  void registerRepositories() {
    sl.registerSingleton(TaskRepositoryImpl(
      localDataSource: sl(),
    ));
  }

  @override
  void registerUseCases() {
    sl.registerSingleton(AddTask(repository: sl()));
    sl.registerSingleton(DeleteTodo());
  }

  @override
  void registerViewModels() {
    sl.registerFactory(() => TasksListViewModel());
    sl.registerFactory(() => TasksViewModel());
    sl.registerSingleton(AddTaskViewModel());
  }

  @override
  void registerAdapters() {}
}
