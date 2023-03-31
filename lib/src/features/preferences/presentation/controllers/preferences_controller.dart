import 'dart:developer';

import 'package:clean_todo/features/preferences/preferences.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/usecases/get_preferences.dart';
import '../../domain/usecases/set_language.dart';

final preferencesProvider =
    StateNotifierProvider.autoDispose<PreferencesController, Preferences>(
        (ref) {
  GetPreferences getPreferences = ref.watch(getPreferencesUseCaseProvider);
  SetLanguage setLanguage = ref.read(setLanguageUseCaseProvider);
  SetThemeMode setThemeMode = ref.read(setThemeModeUseCaseProvider);

  return PreferencesController(
    getPreferences: getPreferences,
    setLanguage: setLanguage,
    setThemeMode: setThemeMode,
  );
});

class PreferencesController extends StateNotifier<Preferences> {
  final SetLanguage setLanguage;
  final GetPreferences getPreferences;
  final SetThemeMode setThemeMode;
  PreferencesController({
    required this.getPreferences,
    required this.setLanguage,
    required this.setThemeMode,
  }) : super(
          Preferences(
            language: "en",
            themeMode: "light",
          ),
        ) {
    fetchPreferences();
  }

  void changeLanguage(String language) async {
    var code = language.split("").take(2).join().toLowerCase();
    var response = await setLanguage(SetLanguageParams(
      language: code,
      preferences: state,
    ));
    response.fold((_) => {}, (r) => state = state.copyWith(language: code));
  }

  void toggleTheme() async {
    final themeMode = state.themeMode == "light" ? "dark" : "light";

    var response = await setThemeMode(SetThemeModeParams(
      themeMode: themeMode,
      preferences: state,
    ));
    response.fold(
      (_) => {},
      (r) => state = state.copyWith(themeMode: themeMode),
    );
  }

  Future<void> fetchPreferences() async {
    var response = await getPreferences();
    response.fold((_) {}, (preferences) {
      log("Prefs: ${preferences?.language}, ${preferences?.themeMode}");
      if (preferences != null) {
        state = preferences;
      }
    });
  }
}
