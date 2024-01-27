part of 'challenge_core.dart';

class CoreState {
  Locale locale;
  ThemeMode themeMode;

  CoreState({
    this.locale = const Locale('pt', 'BR'),
    this.themeMode = ThemeMode.dark,
  });

  CoreState copyWith({
    Locale? locale,
    ThemeMode? themeMode,
  }) {
    return CoreState(
      locale: locale ?? this.locale,
      themeMode: themeMode ?? this.themeMode,
    );
  }
}
