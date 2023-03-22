class Preferences {
  final String? language;
  final String? themeMode;

  Preferences({
    this.language,
    this.themeMode,
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
}
