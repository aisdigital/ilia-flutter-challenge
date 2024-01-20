import 'package:flutter_modular/flutter_modular.dart';
import 'package:ilia_flutter_challenge/app/modules/home/home_module.dart';
import 'package:ilia_flutter_challenge/utils/app_routes.dart';

class AppModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.module(
      AppRoutes.initialRoute,
      module: HomeModule(),
    );
  }
}
