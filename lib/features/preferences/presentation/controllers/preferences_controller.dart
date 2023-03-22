import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/preferences.dart';
import '../../domain/usecases/get_preferences.dart';
import '../../domain/usecases/set_language.dart';

final preferencesControllerProvider =
    StateNotifierProvider.autoDispose<PreferencesController, Preferences>(
        (ref) {
  GetPreferences getPreferences = ref.watch(getPreferencesUseCaseProvider);
  SetLanguage setLanguage = ref.watch(setLanguageUseCaseProvider);

  return PreferencesController(
    getPreferences: getPreferences,
    setLanguage: setLanguage,
  );
});

class PreferencesController extends StateNotifier<Preferences> {
  final SetLanguage setLanguage;
  final GetPreferences getPreferences;
  PreferencesController({
    required this.getPreferences,
    required this.setLanguage,
  }) : super(
          Preferences(
            language: "en",
            themeMode: "light",
          ),
        );

  void changeLanguage(String language) {
    state = state.copyWith(language: language);
  }

  void toggleTheme() {
    state = state.copyWith(
      themeMode: state.themeMode == "light" ? "dark" : "light",
    );
  }

  Future<void> fetchPreferences() async {
    var response = await getPreferences();
    response.fold((_) {}, (preferences) {
      state = preferences;
    });
  }
}
