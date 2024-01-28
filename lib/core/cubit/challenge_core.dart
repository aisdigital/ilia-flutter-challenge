import 'package:flutter/material.dart';
import 'package:ilia_challenge/core/infra/services/router_service.dart';
import 'package:ilia_challenge/main.dart';
import 'package:ilia_challenge/modules/home/view/home_page.dart';

part 'core_state.dart';

class ChallengeCore extends ValueNotifier<CoreState> {
  ChallengeCore(super.value);

  static const String portuguese = 'pt-BR';
  static const String english = 'en-US';

  switchLanguage() {
    const Locale port = Locale('pt', 'BR');
    const Locale eng = Locale('en', 'US');

    Locale locale = value.locale;

    switch (locale) {
      case port:
        locale = eng;
        break;
      default:
        locale = port;
        break;
    }

    value = value.copyWith(locale: locale);
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

  boostrap() async {
    IliaRouter routes = injector.find<IliaRouter>();
    print(' routes.service.pushReplacement(SystemRoutes.signin)');
    if (navigatorKey.currentContext != null) {
      Navigator.pushNamed(
        navigatorKey.currentContext!,
        HomePage.route,
        arguments: {"name": "Movie!!!!!"},
      );
    }
  }
}

enum Language {
  english,
  portuguese;

  // 'language=pt-BR'
  Locale get locale {
    return switch (this) {
      Language.english => const Locale('en', 'US'),
      Language.portuguese => const Locale('pt', 'BR'),
    };
  }

  String get apiParam {
    return switch (this) {
      Language.english => 'language=en-US',
      Language.portuguese => 'language=pt-BR',
    };
  }
}
