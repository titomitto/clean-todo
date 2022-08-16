import 'package:clean_todo/core/presentation/app_localizations.dart';
import 'package:flutter/material.dart';

class TasksSwahiliTranslations extends LocaleTranslations {
  @override
  String get languageCode => "sw";

  @override
  String get countryCode => "KE";

  @override
  Map<String, String> get translations => {
        "hello_world": "Abari dunia!!!",
        "complex_string": "Jina langu ni @{name}, na miaka yangu ni @{age}",
      };
}
