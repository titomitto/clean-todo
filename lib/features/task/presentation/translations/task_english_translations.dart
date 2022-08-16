import 'package:clean_todo/core/presentation/app_localizations.dart';
import 'package:flutter/material.dart';

class TasksEnglishTranslations extends LocaleTranslations {
  @override
  String get languageCode => "en";

  @override
  String get countryCode => "US";

  @override
  Map<String, String> get translations => {
        "hello_world": "Hello World!!!",
        "complex_string": "My name is @{name}, and my age is {{age}}",
      };
}
