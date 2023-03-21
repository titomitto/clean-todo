import 'package:clean_todo/features/preferences/domain/entities/preference.dart';
import '../models/preferences.dart';

extension PreferencesModelExtension on PreferencesModel {
  Preferences toEntity() => Preferences(
        themeMode: themeMode,
        language: language,
      );
}

extension PreferencesExtension on Preferences {
  PreferencesModel toModel() => PreferencesModel(
        themeMode: themeMode,
        language: language,
      );
}
