import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_controller.dart';
import 'core/const/api_const.dart';
import 'core/domain/usecases/get_connectivity_stream_usecase.dart';
import 'core/network/dio_config.dart';
import 'core/network/network_info.dart';
import 'modules/home/home_module.dart';
import 'modules/splash/splash_module.dart';

class AppModule extends Module {
  static String get initialRoute => SplashModule.routeName;
  @override
  final List<Bind> binds = [
    // --------------------- CONTROLLERS ----------------------
    Bind((i) => AppController(getConnectivityStreamUseCase: i())),
    // ---------------------- USE CASES -----------------------
    // ------> Network
    Bind((i) => GetConnectivityStreamUseCase(networkInfo: i())),
    // --------------------- REPOSITORIES ---------------------
    // --------------------- DATA SOURCES ---------------------
    // ----------------------- SERVICES ------------------------
    Bind<INetworkInfo>((i) => NetworkInfo()),
    // ------------------------ OTHERS ------------------------
    Bind((i) => Dio()),
    Bind((i) => DioConfig(
          client: i(),
          endpoint: ApiConst.apiEndpoint,
        )),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(
      SplashModule.routeName,
      module: SplashModule(),
    ),
    ModuleRoute(
      HomeModule.routeName,
      module: HomeModule(),
    ),
  ];
}
