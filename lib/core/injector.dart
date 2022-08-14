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
