import 'package:clean_todo/core/shared/feature.dart';

import 'preferences/preferences.dart';
import 'tasks/tasks.dart';

List<Feature> get features => [
      TasksFeature(),
      PreferencesFeature(),
    ];
