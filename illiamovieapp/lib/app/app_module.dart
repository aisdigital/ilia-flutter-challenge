import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_controller.dart';
import 'core/domain/usecases/get_connectivity_stream_usecase.dart';
import 'core/network/dio_config.dart';
import 'core/network/network_info.dart';

class AppModule extends Module {
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
          endpoint: 'https://api.themoviedb.org/3/',
        )),
  ];

  @override
  final List<ModularRoute> routes = [];
}
