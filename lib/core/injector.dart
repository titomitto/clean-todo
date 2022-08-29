import 'package:clean_todo/core/presentation/app_localizations.dart';
import 'package:get_it/get_it.dart';

import 'presentation/screens/screen.dart';

abstract class Injector {
  List<Screen> screens = [];
  List<LocaleTranslations> translations = [];
  Future<void> registerAdapters() async {}
  Future<void> registerRepositories(GetIt sl) async {}
  Future<void> registerDataSources(GetIt sl) async {}
  Future<void> registerViewModels(GetIt sl) async {}
  Future<void> registerUseCases(GetIt sl) async {}
}
