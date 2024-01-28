import 'package:flutter/material.dart';
import 'package:ilia_challenge/core/cubit/challenge_core.dart';
import 'package:ilia_challenge/core/infra/services/adapters/dependency_injector_adapter/auto_injector.dart';
import 'package:ilia_challenge/core/infra/interfaces/int_dep_injector.dart';
import 'package:ilia_challenge/core/infra/services/router_service.dart';
import 'package:ilia_challenge/core/infra/services/theme/dark_theme.dart';
import 'package:ilia_challenge/core/infra/services/theme/light_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ilia_challenge/modules/auth/view/pages/signin_page.dart';

late final IntDepInjector injector;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  injector = AutoInjectorAdapter()..init();
  runApp(const IliaApp());
}

class IliaApp extends StatelessWidget {
  const IliaApp({super.key});
  ChallengeCore get core => injector.find<ChallengeCore>();
  IliaRouter get routes => injector.find<IliaRouter>();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: core,
        builder: (context, state, _) {
          return MaterialApp(
            title: AppLocalizations.of(context)?.iliaChallenge ?? '',
            debugShowCheckedModeBanner: false,
            themeMode: state.themeMode,
            darkTheme: DarkTheme(context).themeData(),
            theme: LightTheme(context).themeData(),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: core.value.locale,
            initialRoute: SignInPage.route,
            navigatorKey: navigatorKey,
            onGenerateRoute: IliaRouter.service,
          );
        });
  }
}
