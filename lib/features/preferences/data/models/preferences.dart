import 'package:hive/hive.dart';

part 'preferences.g.dart';

@HiveType(typeId: 1)
class PreferencesModel {
  @HiveField(0)
  final String language;
  @HiveField(1)
  final String themeMode;

  PreferencesModel({
    required this.language,
    required this.themeMode,
  });

  copyWith({
    String? language,
    String? themeMode,
  }) {
    return PreferencesModel(
      language: language ?? this.language,
      themeMode: themeMode ?? this.themeMode,
    );
  }
}
