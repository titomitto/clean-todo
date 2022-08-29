import 'package:clean_todo/core/injector.dart';
import 'package:clean_todo/core/presentation/app.dart';
import 'package:clean_todo/core/utils/sl.dart';
import 'package:clean_todo/features/task/todo_injector.dart';

List<Injector> get featureInjectors => [
      TodoInjector(),
      ClassName(),
    ];

class ClassName extends Injector {
  @override
  Future<void> registerViewModels() async {
    sl.registerFactory(() => MOOsViewModel());
  }
}
