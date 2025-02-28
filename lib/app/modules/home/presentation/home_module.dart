import 'package:flutter_modular/flutter_modular.dart';
import 'package:pixel_cinema/app/app_module.dart';
import 'package:pixel_cinema/app/core/presentation/navigation/routes.dart';
import 'package:pixel_cinema/app/modules/home/data/datasources/movies_datasource.dart';
import 'package:pixel_cinema/app/modules/home/domain/repositories/movies_repository.dart';
import 'package:pixel_cinema/app/modules/home/domain/use_cases/fetch_movies_from_theatres_use_case.dart';
import 'package:pixel_cinema/app/modules/home/domain/use_cases/fetch_video_use_case.dart';
import 'package:pixel_cinema/app/modules/home/domain/use_cases/search_movies_use_case.dart';
import 'package:pixel_cinema/app/modules/home/presentation/controllers/home_controller.dart';
import 'package:pixel_cinema/app/modules/home/presentation/pages/home_page.dart';
import 'package:pixel_cinema/app/modules/home/presentation/stores/home_store.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [
        AppModule(),
      ];

  @override
  void binds(i) {
    i.add<HomeStore>(HomeStore.new);
    i.add<MoviesDatasource>(MoviesDatasourceImpl.new);
    i.add<MoviesRepository>(MoviesRepositoryImpl.new);
    i.add<FetchMoviesFromTheatresUseCase>(FetchMoviesFromTheatresUseCaseImpl.new);
    i.add<FetchVideoUseCase>(FetchVideoUseCaseImpl.new);
    i.add<SearchMoviesUseCase>(SearchMoviesUseCaseImpl.new);
    i.add<HomeController>(HomeController.new);
  }

  @override
  void routes(r) {
    r.child(
      Paths.root,
      child: (c) => const HomePage(),
    );
  }
}
