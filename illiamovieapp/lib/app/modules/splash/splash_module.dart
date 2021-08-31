import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/pages/splash_page.dart';

class SplashModule extends Module {
  static String get routeName => '/splash';

  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => SplashPage(),
    ),
  ];
}
