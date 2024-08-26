import 'package:get_it/get_it.dart';
import 'package:movie_catalog/core/network/dio_client.dart';
import 'package:movie_catalog/features/features.dart';

final GetIt locator = GetIt.instance;

void initLocator() {
  locator.registerLazySingleton<DioClient>(() => DioClient());

  locator
    ..registerLazySingleton<MovieDetailsRemoteDataSource>(() => MovieDetailsRemoteDataSourceImpl())
    ..registerLazySingleton<MovieVideosResponseRemoteDataSource>(() => MovieVideosResponseRemoteDataSourceImpl())
    ..registerLazySingleton<GenreRemoteDataSource>(() => GenreRemoteDataSourceImpl())
    ..registerLazySingleton<MoviesListRemoteDataSource>(() => MoviesListRemoteDataSourceImpl());

  locator
    ..registerLazySingleton<MovieDetailsRepository>(() => MovieDetailsRepositoryImpl(locator()))
    ..registerLazySingleton<MovieVideosResponseRepository>(() => MovieVideosResponseRepositoryImpl(locator()))
    ..registerLazySingleton<GenreRepository>(() => GenreRepositoryImpl(locator()))
    ..registerLazySingleton<MovieResponseRepository>(() => MovieResponseRepositoryImpl(locator()));

  locator
    ..registerFactory<GetMovieDetailsUseCase>(() => GetMovieDetailsUseCase(locator()))
    ..registerFactory<GetMovieVideosResponseUseCase>(() => GetMovieVideosResponseUseCase(locator()))
    ..registerFactory<GetGenresUseCase>(() => GetGenresUseCase(locator()))
    ..registerFactory<GetMoviesUseCase>(() => GetMoviesUseCase(locator()));

  locator
    ..registerFactory<MovieDetailsPageCubit>(() => MovieDetailsPageCubit(locator(), locator()))
    ..registerFactory<HomePageCubit>(() => HomePageCubit(locator(), locator()));
}
