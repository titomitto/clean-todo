class Preferences {
  final String language;
  final bool darkModeEnabled;

  Preferences({
    required this.language,
    required this.darkModeEnabled,
  });

  Preferences copyWith({
    String? language,
    bool? darkModeEnabled,
  }) {
    return Preferences(
      language: language ?? this.language,
      darkModeEnabled: darkModeEnabled ?? this.darkModeEnabled,
    );
  }
}
