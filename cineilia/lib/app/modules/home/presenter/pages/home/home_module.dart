import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_ilia/app/modules/home/domain/usecases/get_filmes_popular.dart';
import 'package:teste_ilia/app/modules/home/domain/usecases/get_filmes_rated.dart';
import 'package:teste_ilia/app/modules/home/domain/usecases/search_filmes_usecases.dart';
import 'package:teste_ilia/app/modules/home/external/datasource/home_datasource_impl.dart';
import 'package:teste_ilia/app/modules/home/infra/repository/home_repository_impl.dart';
import 'package:teste_ilia/app/modules/home/presenter/blocs/filmes_popular/filmes_popular_cubit.dart';
import 'package:teste_ilia/app/modules/home/presenter/blocs/filmes_rated/filmes_rated_cubit.dart';
import 'package:teste_ilia/app/modules/home/presenter/blocs/search_filmes/search_filmes_cubit.dart';
import 'package:teste_ilia/app/modules/home/presenter/pages/home/home_page.dart';
import 'package:teste_ilia/app/modules/home/presenter/pages/seach/seach_page.dart';
import 'package:teste_ilia/app/shared/util/dio_builder.dart';

class HomeModule extends Module {

  @override
  List<Bind<Object>> get binds => [
    Bind((i) => DioBuilderFilmes()),
    Bind((i) => Dio(i<DioBuilderFilmes>())),
    Bind((i) => HomeDataSourceImpl(dio: i())),
    Bind((i) => HomeRepositoryImpl(homeDatasource: i<HomeDataSourceImpl>())),
    Bind((i) => GetFilmesPopularUsecasesImpl(homeRepository: i<HomeRepositoryImpl>())),
    Bind((i) => GetFilmesRatedUsecasesImpl(homeRepository: i<HomeRepositoryImpl>())),
    Bind((i) => SearchFilmesUsacasesImpl(homeRepository: i<HomeRepositoryImpl>())),
    Bind.factory((i) => FilmesPopularCubit(i<GetFilmesPopularUsecasesImpl>())),
    Bind.factory((i) => FilmesRatedCubit(i<GetFilmesRatedUsecasesImpl>())),
    Bind.factory((i) => SearchFilmesCubit(i<SearchFilmesUsacasesImpl>()))
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (contex,_) => const HomePage()),
    ChildRoute('/search', child: (contex,_) => const SearchPage())
  ];
  
}