import 'package:clean_todo/features/preferences/presentation/screens/preferences_screen.dart';
import 'package:go_router/go_router.dart';

final List<GoRoute> preferencesRoutes = [
  GoRoute(
    path: PreferencesScreen.routePath,
    builder: (context, state) => const PreferencesScreen(),
  ),
];
