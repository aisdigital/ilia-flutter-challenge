import 'package:flutter_modular/flutter_modular.dart';
import 'data/datasources/i_movie_details_remote_datasource.dart';
import 'data/datasources/movie_details_dio_datasource.dart';
import 'data/repositories/movie_details_repository.dart';
import 'domain/repositories/i_movie_details_repository.dart';
import 'domain/usecases/get_movie_details_usecase.dart';
import 'domain/usecases/get_movie_similars_usecase.dart';
import 'domain/usecases/get_movie_video_usecase.dart';
import 'presentation/controller/movie_details_controller.dart';
import 'presentation/pages/movie_details_page.dart';

class MovieDetailsModule extends Module {
  static String get routeName => '/details';
  @override
  final List<Bind> binds = [
    // --------------------- CONTROLLERS ----------------------
    Bind((i) => MovieDetailsController(
          movieId: i.args!.data['movieId'],
          getMovieDetailsUseCase: i(),
          getMovieSimilarsUseCase: i(),
          getMovieVideoUseCase: i(),
        )),
    // ---------------------- USE CASES -----------------------
    Bind((i) => GetMovieDetailsUseCase(movieDetailsRepository: i())),
    Bind((i) => GetMovieSimilarsUseCase(movieDetailsRepository: i())),
    Bind((i) => GetMovieVideoUseCase(movieDetailsRepository: i())),
    // --------------------- REPOSITORIES ---------------------
    Bind<IMovieDetailsRepository>((i) => MovieDetailsRepository(
          networkInfo: i(),
          movieDetailsRemoteDatasource: i(),
        )),
    // --------------------- DATA SOURCES ---------------------
    Bind<IMovieDetailsRemoteDatasource>(
        (i) => MovieDetailsDioDatasource(client: i())),
    // ----------------------- SERVICES ------------------------
    // ------------------------ OTHERS ------------------------
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => MovieDetailsPage(),
    ),
  ];
}
