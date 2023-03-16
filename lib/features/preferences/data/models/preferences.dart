import 'package:hive/hive.dart';

part 'preferences.g.dart';

@HiveType(typeId: 1)
class PreferencesModel {
  @HiveField(0)
  final String language;
  @HiveField(1)
  final bool darkModeEnabled;

  PreferencesModel({
    required this.language,
    required this.darkModeEnabled,
  });
}
