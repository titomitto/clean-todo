import 'package:clean_todo/core/shared/feature.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'data/models/preferences.dart';
import 'presentation/preferences_routes.dart';
export 'data/data.dart';
export 'domain/domain.dart';
export 'presentation/presentation.dart';

class PreferencesFeature extends Feature {
  @override
  List<RouteBase> get routes => preferencesRoutes;
  @override
  Future<void> preregister() async {
    Hive.registerAdapter(PreferencesModelAdapter());
  }
}
