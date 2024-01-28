import 'package:auto_injector/auto_injector.dart';
import 'package:ilia_challenge/core/cubit/challenge_core.dart';
import 'package:ilia_challenge/core/domain/interfaces/int_cache_service.dart';
import 'package:ilia_challenge/core/domain/interfaces/int_http_service.dart';
import 'package:ilia_challenge/core/infra/services/http_handler_service.dart';
import 'package:ilia_challenge/core/infra/services/cache_handler_service.dart';
import 'package:ilia_challenge/core/infra/interfaces/int_dep_injector.dart';
import 'package:ilia_challenge/core/infra/services/router_service.dart';
import 'package:ilia_challenge/modules/auth/domain/auth_respository.dart';
import 'package:ilia_challenge/modules/auth/view/state/auth_state.dart';
import 'package:ilia_challenge/modules/auth/view/state/auth_store.dart';
import 'package:ilia_challenge/modules/home/domain/home_repository.dart';
import 'package:ilia_challenge/modules/movie/domain/movie_repository.dart';

class AutoInjectorAdapter implements IntDepInjector {
  static AutoInjector? _injector;

  get instance => _injector ??= AutoInjector();

  @override
  init() async {
    _injector ??= AutoInjector();

    await instance
      ..addSingleton(HttpHandlerService.new)
      ..addSingleton(AuthStore.new)
      ..addSingleton(ChallengeCore.new)
      ..addSingleton(CoreState.new)
      ..addSingleton(CacheHandlerService.new)
      ..addSingleton(IliaRouter.new)
      ..addSingleton(AuthState.new)
      ..add(SignInRepository.new)
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

      case AuthStore:
        return instance<AuthStore>();
      case AuthState:
        return instance<AuthState>();
      case IliaRouter:
        return instance<IliaRouter>();
      case SignInRepository:
        return instance<SignInRepository>();
      case HomeRepository:
        return instance<HomeRepository>();
      case MovieRepository:
        return instance<MovieRepository>();
      default:
        return null;
    }
  }
}
