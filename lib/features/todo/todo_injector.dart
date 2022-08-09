import 'package:clean_todo/core/domain/usecases/usecase.dart';
import 'package:clean_todo/core/injector.dart';
import 'package:clean_todo/core/presentation/screens/screen.dart';
import 'package:clean_todo/core/presentation/view_models/view_model.dart';
import 'package:clean_todo/core/utils/service_locator.dart';
import 'package:clean_todo/features/todo/domain/usecases/add_count.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'domain/usecases/increment_count.dart';
import 'presentation/screens/todos_screen.dart';
import 'presentation/view_models/todos_view_model.dart';

class TodoInjector extends Injector {
  @override
  List<Screen> get screens => [
        TodosScreen(),
      ];

  @override
  List<ViewModel> get viewModels => [
        TodosViewModel(),
      ];

  @override
  List<UseCase> get useCases => [
        AddCount(),
        DecrementCount(),
      ];

  @override
  List<TypeAdapter> get adapters => [];
}
