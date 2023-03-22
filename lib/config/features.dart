import 'package:clean_todo/core/shared/feature.dart';

import '../features/preferences/preferences.dart';
import '../features/tasks/tasks.dart';

List<Feature> get features => [
      TasksFeature(),
      PreferencesFeature(),
    ];
