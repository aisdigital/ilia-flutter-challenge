import 'package:flutter_modular/flutter_modular.dart';

import 'domain/usecases/initializers_usecase.dart';
import 'presentation/controller/splash_controller.dart';
import 'presentation/pages/splash_page.dart';

class SplashModule extends Module {
  static String get routeName => '/splash';

  @override
  final List<Bind> binds = [
    // --------------------- CONTROLLERS ----------------------
    Bind((i) => SplashController(initializersUseCase: i())),
    // ---------------------- USE CASES -----------------------
    Bind((i) => InitializersUseCase(
          dioConfig: i(),
          networkInfo: i(),
        )),
    // --------------------- REPOSITORIES ---------------------
    // --------------------- DATA SOURCES ---------------------
    // ----------------------- SERVICES ------------------------
    // ------------------------ OTHERS ------------------------
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => SplashPage(),
    ),
  ];
}
