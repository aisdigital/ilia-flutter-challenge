import 'package:core/client/http_client.dart';
import 'package:core/client/http_client_impl.dart';
import 'package:core/core.dart';
import 'package:service/movie/repository/remote/details/details_repository.dart';
import 'package:service/movie/repository/remote/details/details_repository_impl.dart';
import 'package:service/movie/repository/remote/now_playing/now_playing_repository.dart';
import 'package:service/movie/repository/remote/now_playing/now_playing_repository_impl.dart';
import 'package:service/movie/repository/remote/search/search_repository.dart';
import 'package:service/movie/repository/remote/search/search_repository_impl.dart';
import 'package:service/movie/repository/remote/video/video_repository.dart';
import 'package:service/movie/repository/remote/video/video_repository_impl.dart';

final getIt = GetIt.instance;

void setupInjectors() {
  // repositories
  getIt.registerFactory<MovieNowPlayingRepository>(() => MovieNowPlayingRepositoryImpl());
  getIt.registerFactory<MovieDetailsRepository>(() => MovieDetailsRepositoryImpl());
  getIt.registerFactory<MovieVideoRepository>(() => MovieVideoRepositoryImpl());
  getIt.registerFactory<MovieSearchRepository>(() => MovieSearchRepositoryImpl());

  // data sources
  getIt.registerFactory<HttpClient>(() => HttpClientImpl());
}
