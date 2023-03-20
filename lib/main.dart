import 'package:clean_todo/initializer.dart';
import 'config/features.dart';

Future<void> main() async {
  // Pass required features to the initializer
  final initializer = Initializer(
    features: features,
    initialRoute: '/',
  );
  // initialize the app
  await initializer.initializeApp();
}
