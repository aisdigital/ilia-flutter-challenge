import 'package:flutter/material.dart';

part 'core_state.dart';

class ChallengeCore extends ValueNotifier<CoreState> {
  ChallengeCore(super.value);

  static const String portuguese = 'pt-BR';
  static const String english = 'en-US';

  switchLanguage() {
    String language = value.language;

    switch (language) {
      case 'language=$portuguese':
        language = 'language=$english';
        break;
      default:
        language = 'language=$portuguese';
        break;
    }
    value = value.copyWith(language: language);
    notifyListeners();
  }

  switchTheme() {
    ThemeMode themeMode = value.themeMode;

    switch (themeMode) {
      case ThemeMode.dark:
        themeMode = ThemeMode.light;
        break;
      default:
        themeMode = ThemeMode.dark;
        break;
    }
    value = value.copyWith(themeMode: themeMode);
    notifyListeners();
  }
}
