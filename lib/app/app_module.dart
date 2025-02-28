import 'package:flutter_modular/flutter_modular.dart';
import 'package:pixel_cinema/app/core/data/datasources/remote_datasource.dart';
import 'package:pixel_cinema/app/core/data/infra/dio_datasource.dart';
import 'package:pixel_cinema/app/core/presentation/navigation/routes.dart';
import 'package:pixel_cinema/app/modules/home/presentation/home_module.dart';

class AppModule extends Module {
  @override
  void exportedBinds(i) {
    i.add<RemoteDatasource>(() => DioDatasource());
  }

  @override
  void routes(r) {
    r.module(
      Paths.home,
      module: HomeModule(),
    );
  }
}
