import 'package:equatable/equatable.dart';

class Preferences extends Equatable {
  final String language;
  final String themeMode;

  Preferences({
    required this.language,
    required this.themeMode,
  });

  Preferences copyWith({
    String? language,
    String? themeMode,
  }) {
    return Preferences(
      language: language ?? this.language,
      themeMode: themeMode ?? this.themeMode,
    );
  }

  @override
  List<Object?> get props => [language, themeMode];
}
