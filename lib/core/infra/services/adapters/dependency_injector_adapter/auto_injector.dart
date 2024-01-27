import 'package:auto_injector/auto_injector.dart';
import 'package:ilia_challenge/core/cubit/challenge_core.dart';
import 'package:ilia_challenge/core/domain/interfaces/int_cache_service.dart';
import 'package:ilia_challenge/core/domain/interfaces/int_http_service.dart';
import 'package:ilia_challenge/core/infra/services/http_handler_service.dart';
import 'package:ilia_challenge/core/infra/services/cache_handler_service.dart';
import 'package:ilia_challenge/core/infra/interfaces/int_dep_injector.dart';
import 'package:ilia_challenge/modules/home/domain/home_repository.dart';
import 'package:ilia_challenge/modules/movie/domain/movie_repository.dart';

class AutoInjectorAdapter implements IntDepInjector {
  static AutoInjector? _injector;

  get instance => _injector ??= AutoInjector();

  @override
  init() {
    _injector ??= AutoInjector();

    instance
      ..addSingleton(ChallengeCore.new)
      ..addSingleton(CacheHandlerService.new)
      ..addSingleton(HttpHandlerService.new)
      ..addSingleton(CoreState.new)
      ..add(HomeRepository.new)
      ..add(MovieRepository.new)
      ..commit();
  }

  @override
  find<T>() {
    switch (T) {
      case ChallengeCore:
        return instance<ChallengeCore>();
      case IntCacheHandlerService:
        return instance<CacheHandlerService>();
      case IntHttpService:
        return instance<HttpHandlerService>();
      case HomeRepository:
        return instance<HomeRepository>();
      case MovieRepository:
        return instance<MovieRepository>();
      default:
        return null;
    }
  }
}
