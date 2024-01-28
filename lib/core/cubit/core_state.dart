part of 'challenge_core.dart';

class CoreState {
  Locale locale;
  ThemeMode themeMode;
  final MediaConfig? mediaConfig;

  CoreState({
    this.locale = const Locale('pt', 'BR'),
    this.themeMode = ThemeMode.dark,
    this.mediaConfig,
  });

  CoreState copyWith({
    Locale? locale,
    ThemeMode? themeMode,
    MediaConfig? mediaConfig,
  }) {
    return CoreState(
      locale: locale ?? this.locale,
      themeMode: themeMode ?? this.themeMode,
      mediaConfig: mediaConfig ?? this.mediaConfig,
    );
  }
}
