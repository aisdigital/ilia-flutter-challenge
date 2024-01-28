import 'package:auto_injector/auto_injector.dart';
import 'package:ilia_challenge/core/cubit/challenge_core.dart';
import 'package:ilia_challenge/core/domain/interfaces/int_cache_service.dart';
import 'package:ilia_challenge/core/domain/interfaces/int_http_service.dart';
import 'package:ilia_challenge/core/infra/services/http_handler_service.dart';
import 'package:ilia_challenge/core/infra/services/cache_handler_service.dart';
import 'package:ilia_challenge/core/infra/interfaces/int_dep_injector.dart';
import 'package:ilia_challenge/core/infra/services/router_service.dart';
import 'package:ilia_challenge/modules/auth/view/state/auth_state.dart';
import 'package:ilia_challenge/modules/auth/view/state/auth_store.dart';
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
      ..addSingleton(CoreState.new)
      ..addSingleton(CacheHandlerService.new)
      ..addSingleton(HttpHandlerService.new)
      ..addSingleton(IliaRouter.new)
      ..addSingleton(AuthStore.new)
      ..addSingleton(AuthState.new)
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
      case AuthStore:
        return instance<AuthStore>();
      case AuthState:
        return instance<AuthState>();
      case IliaRouter:
        return instance<IliaRouter>();
      case MovieRepository:
        return instance<MovieRepository>();
      default:
        return null;
    }
  }
}
