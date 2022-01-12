import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_ilia/app/modules/home/presenter/pages/home/home_module.dart';


class AppModule extends Module {

  @override
  List<Bind<Object>> get binds => [];
  
  @override
  List<ModularRoute> get routes => [
    ModuleRoute('/', module: HomeModule())
  ];
}