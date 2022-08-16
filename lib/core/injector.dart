import 'package:clean_todo/core/presentation/app_localizations.dart';

import 'presentation/screens/screen.dart';

abstract class Injector {
  List<Screen> screens = [];
  List<LocaleTranslations> translations = [];
  void registerAdapters() {}
  void registerRepositories() {}
  void registerDataSources() {}
  void registerViewModels() {}
  void registerUseCases() {}
}
