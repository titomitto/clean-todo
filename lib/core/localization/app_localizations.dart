import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var appLocalizationsProvider =
    Provider<LocalizationsDelegate<AppLocalizations>>((ref) {
  return AppLocalizations.delegate;
});

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  Map<String, String> _localizedStrings = {};

  Future<bool> load() async {
    // Load the language JSON file from the "i18n" folder
    try {
      String jsonString =
          await rootBundle.loadString('i18n/${locale.languageCode}.json');
      Map<String, dynamic> jsonMap = json.decode(jsonString);
      _localizedStrings = jsonMap.map((key, value) => MapEntry(key, value));
    } catch (e) {
      String jsonString = await rootBundle.loadString('i18n/en.json');
      Map<String, dynamic> jsonMap = json.decode(jsonString);
      _localizedStrings = jsonMap.map((key, value) => MapEntry(key, value));
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
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return true;
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations localizations = AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

extension Translation on String {
  String get tr => trWith();

  String trWith([Map<String, dynamic>? values]) {
    String translated = GetIt.I<AppLocalizations>().translate(this);
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
