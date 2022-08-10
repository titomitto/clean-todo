import 'package:clean_todo/core/domain/usecases/usecase.dart';
import 'package:clean_todo/core/presentation/view_models/view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

import 'presentation/screens/screen.dart';

abstract class Injector {
  List<Screen> screens = [];
  List translations = [];
  void registerAdapters() {}
  void registerRepositories() {}
  void registerDataSources() {}
  void registerViewModels() {}
  void registerUseCases() {}
}
