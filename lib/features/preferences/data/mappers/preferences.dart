import 'package:clean_todo/features/preferences/domain/entities/preferences.dart';
import '../models/preferences.dart';

extension PreferencesModelExtension on PreferencesModel {
  Preferences toEntity() => Preferences(
        darkModeEnabled: darkModeEnabled,
        language: language,
      );
}

extension PreferencesExtension on Preferences {
  PreferencesModel toModel() => PreferencesModel(
        darkModeEnabled: darkModeEnabled,
        language: language,
      );
}
