import 'package:flutter_modular/flutter_modular.dart';
import 'package:ilia_flutter_challenge/app/modules/movie_details/domain/repositories/movie_details_repository.dart';
import 'package:ilia_flutter_challenge/app/modules/movie_details/domain/usecases/fetch_movie_details_usecase.dart';
import 'package:ilia_flutter_challenge/app/modules/movie_details/domain/usecases/fetch_movie_details_usecase_impl.dart';
import 'package:ilia_flutter_challenge/app/modules/movie_details/external/datasources/movie_details_datasource_impl.dart';
import 'package:ilia_flutter_challenge/app/modules/movie_details/infra/datasources/movie_details_datasource.dart';
import 'package:ilia_flutter_challenge/app/modules/movie_details/infra/repositories/movie_details_repository_impl.dart';
import 'package:ilia_flutter_challenge/app/modules/movie_details/presenter/pages/movies_details_page.dart';
import 'package:ilia_flutter_challenge/app/modules/movie_details/presenter/store/movie_details_store.dart';
import 'package:ilia_flutter_challenge/utils/app_routes.dart';

class MoviesDetailsModule extends Module {
  @override
  void binds(i) {
    i.add<MovieDetailsDatasource>(MovieDetailsDatasourceImpl.new);
    i.add<MovieDetailsRepository>(MovieDetailsRepositoryImpl.new);
    i.add<FetchMovieDetailsUsecase>(FetchMovieDetailsUsecaseImpl.new);
    i.add(MovieDetailsStore.new);
  }

  @override
  void routes(r) {
    r.child(
      AppRoutes.initialRoute,
      child: (context) => MoviesDetailsPage(
        movieId: r.args.data,
        store: context.read<MovieDetailsStore>(),
      ),
    );
  }
}
