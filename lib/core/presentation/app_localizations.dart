import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  // Helper method to keep the code in the widgets concise
  // Localizations are accessed using an InheritedWidget "of" syntax
  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  Map<String, String> _localizedStrings = {};

  Future<bool> load() async {
    // Load the language JSON file from the "lang" folder
    try {
      String jsonString =
          await rootBundle.loadString('i18n/${locale.languageCode}.json');
      Map<String, dynamic> jsonMap = json.decode(jsonString);
      _localizedStrings = jsonMap.map((key, value) => MapEntry(key, value));
    } catch (e) {
      log("Error Loading Translations: $e");
    }

    for (var translation in GetIt.I<List<LocaleTranslations>>()) {
      if (translation.languageCode == locale.languageCode) {
        _localizedStrings.addAll(translation.translations);
      }
    }

    return true;
  }

  // This method will be called from every widget which needs a localized text
  String translate(String key) {
    return _localizedStrings[key] ?? key;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  // This delegate instance will never change (it doesn't even have fields!)
  // It can provide a constant constructor.
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    var translations = GetIt.I<List<LocaleTranslations>>();
    var languageCodes = translations.map((t) => t.languageCode).toSet();
    // Include all of your supported language codes here
    return languageCodes.contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    // AppLocalizations class is where the JSON loading actually runs
    AppLocalizations localizations = AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

abstract class LocaleTranslations {
  String get languageCode;
  String get countryCode;

  Map<String, String> get translations;
}

extension Translation on String {
  String tr(BuildContext context, [Map<String, dynamic>? values]) {
    String translated = AppLocalizations.of(context)!.translate(this);
    if (values != null) {
      translated = translated.replaceAllMapped(RegExp(r'@\{(.*?)\}'), (match) {
        if (!values.containsKey(match.group(1))) {
          return "${match.group(0)}";
        }

        String arg = match.group(1) ?? "";
        arg = arg.trim();
        return "${values[arg]}";
      });
    }
    return translated;
  }
}
