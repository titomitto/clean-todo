import 'package:clean_todo/features/preferences/domain/entities/preferences.dart';
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
