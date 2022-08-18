import 'package:clean_todo/core/presentation/app_localizations.dart';

import 'presentation/screens/screen.dart';

abstract class Injector {
  List<Screen> screens = [];
  List<LocaleTranslations> translations = [];
  Future<void> registerAdapters() async {}
  Future<void> registerRepositories() async {}
  Future<void> registerDataSources() async {}
  Future<void> registerViewModels() async {}
  Future<void> registerUseCases() async {}
}
