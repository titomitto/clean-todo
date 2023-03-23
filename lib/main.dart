import 'package:clean_todo/features/tasks/presentation/screens/tasks_screen.dart';
import 'package:clean_todo/initializer.dart';
import 'features/features.dart';

Future<void> main() async {
  // Pass required features to the initializer
  final initializer = Initializer(
    features: features,
    initialRoute: TasksScreen.routePath,
  );
  // initialize the app
  await initializer.initializeApp();
}
