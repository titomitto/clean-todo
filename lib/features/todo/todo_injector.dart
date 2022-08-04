import 'package:clean_todo/core/presentation/screens/screen.dart';
import 'package:clean_todo/core/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'presentation/screens/todos_screen.dart';

abstract class FeatureInjector {
  List<Screen> screens = [];
  List translations = [];
  List syncables = [];
  List<ChangeNotifierProvider> providers = [];
}

class InjectFeatures {
  List<FeatureInjector> injectors;
  InjectFeatures(this.injectors);

  call() {}
}
