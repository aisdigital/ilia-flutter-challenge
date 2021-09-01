import 'package:flutter_modular/flutter_modular.dart';

import 'data/datasources/i_movies_remote_datasource.dart';
import 'data/datasources/movies_dio_datasource.dart';
import 'data/repositories/movies_repository.dart';
import 'domain/repositories/i_movies_repository.dart';
import 'domain/usecases/get_movies_in_theatre_usecase.dart';
import 'presentation/controller/home_controller.dart';
import 'presentation/pages/home_page.dart';

class HomeModule extends Module {
  static String get routeName => '/home';
  @override
  final List<Bind> binds = [
    // --------------------- CONTROLLERS ----------------------
    Bind((i) => HomeController(getMoviesInTheatreUseCase: i())),
    // ---------------------- USE CASES -----------------------
    Bind((i) => GetMoviesInTheatreUseCase(moviesRepository: i())),
    // --------------------- REPOSITORIES ---------------------
    Bind<IMoviesRepository>((i) => MoviesRepository(
          moviesRemoteDatasource: i(),
          networkInfo: i(),
        )),
    // --------------------- DATA SOURCES ---------------------
    Bind<IMoviesRemoteDatasource>((i) => MoviesDioDatasource(client: i())),
    // ----------------------- SERVICES ------------------------
    // ------------------------ OTHERS ------------------------
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => HomePage(),
    ),
  ];
}
