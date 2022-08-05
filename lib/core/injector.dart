import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import 'presentation/screens/screen.dart';

abstract class Injector {
  List<Screen> screens = [];
  List translations = [];
  List usecases = [];
  List<ChangeNotifierProvider> providers = [];
  List<TypeAdapter> adapters = [];
}
