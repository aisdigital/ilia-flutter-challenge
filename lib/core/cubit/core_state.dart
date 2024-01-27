part of 'challenge_core.dart';

class CoreState {
  String language;
  ThemeMode themeMode;

  CoreState({
    this.language = 'language=pt-BR',
    this.themeMode = ThemeMode.dark,
  });

  CoreState copyWith({
    String? language,
    ThemeMode? themeMode,
  }) {
    return CoreState(
      language: language ?? this.language,
      themeMode: themeMode ?? this.themeMode,
    );
  }
}
