import 'package:clean_todo/core/core.dart';
import 'package:clean_todo/features/preferences/data/models/preferences.dart';

abstract class PreferencesLocalDataSource implements LocalDataSource {
  Future<PreferencesModel> getPreferences();
  Future<void> setThemeMode(String themeMode);
  Future<void> setLanguage(String language);
}
