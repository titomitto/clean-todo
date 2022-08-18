import 'package:clean_todo/core/injector.dart';
import 'package:clean_todo/features/task/todo_injector.dart';

List<Injector> get featureInjectors => [
      TodoInjector(),
    ];
