import 'package:clean_todo/core/presentation/app_localizations.dart';

class TasksEnTranslations extends LocaleTranslations {
  @override
  String get languageCode => "en";

  @override
  String get countryCode => "US";

  @override
  Map<String, String> get translations => {
        "hello_world": "Hello World!!!",
        "complex_string": "My name is @{name}, and my age is @{age}",
        "tasks_title": "Tasks",
      };
}

class TasksSwTranslations extends LocaleTranslations {
  @override
  String get languageCode => "sw";

  @override
  String get countryCode => "KE";

  @override
  Map<String, String> get translations => {
        "hello_world": "Habari dunia!!!",
        "complex_string": "Jina langu ni @{name}, na miaka yangu ni @{age}",
        "tasks_title": "Kazi",
      };
}
