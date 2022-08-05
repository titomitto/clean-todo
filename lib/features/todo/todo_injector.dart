import 'package:clean_todo/core/injector.dart';
import 'package:clean_todo/core/presentation/router.dart';
import 'package:clean_todo/core/presentation/screens/screen.dart';
import 'package:clean_todo/core/utils/service_locator.dart';
import 'package:clean_todo/features/todo/domain/usecases/add_count.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart';
import 'domain/usecases/increment_count.dart';
import 'presentation/screens/todos_screen.dart';
import 'presentation/view_models/todos_view_model.dart';

class TodoInjector extends Injector {
  @override
  List<Screen> get screens => [
        TodosScreen(),
      ];

  @override
  List get usecases => [
        AddCount(),
        IncrementCount(),
      ];

  @override
  List<ChangeNotifierProvider> get providers => [
        ChangeNotifierProvider<TodosViewModel>.value(value: TodosViewModel()),
      ];
}
