import 'package:flutter_modular/flutter_modular.dart';
import 'package:ilia_flutter_challenge/app/modules/home/domain/repositories/now_playing_movies_repository.dart';
import 'package:ilia_flutter_challenge/app/modules/home/domain/usecases/fetch_now_playing_movies_usecase.dart';
import 'package:ilia_flutter_challenge/app/modules/home/domain/usecases/fetch_now_playing_movies_usecase_impl.dart';
import 'package:ilia_flutter_challenge/app/modules/home/external/datasources/now_playing_movies_datasource_impl.dart';
import 'package:ilia_flutter_challenge/app/modules/home/infra/datasources/now_playing_movies_datasource.dart';
import 'package:ilia_flutter_challenge/app/modules/home/infra/repositories/now_playing_movies_repository_impl.dart';
import 'package:ilia_flutter_challenge/app/modules/home/presenter/pages/home_page.dart';
import 'package:ilia_flutter_challenge/app/modules/home/presenter/store/home_store.dart';
import 'package:ilia_flutter_challenge/utils/app_routes.dart';

class HomeModule extends Module {
  @override
  void binds(i) {
    i.add<NowPlayingMoviesDatasource>(NowPlayingMoviesDatasourceImpl.new);
    i.add<NowPlayingMoviesRepository>(NowPlayingMoviesRepositoryImpl.new);
    i.add<FetchNowPlayingMoviesUsecase>(FetchNowPlayingMoviesUsecaseImpl.new);
    i.add(HomeStore.new);
  }

  @override
  void routes(r) {
    r.child(
      AppRoutes.initialRoute,
      child: (context) => HomePage(store: context.read<HomeStore>()),
    );
  }
}
