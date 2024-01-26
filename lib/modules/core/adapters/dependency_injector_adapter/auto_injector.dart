import 'package:auto_injector/auto_injector.dart';
import 'package:ilia_challenge/modules/core/domain/services/ilia_http_service.dart';
import 'package:ilia_challenge/modules/core/domain/services/cache_handler_service.dart';
import 'package:ilia_challenge/modules/core/infra/interfaces/int_http_client.dart';
import 'package:ilia_challenge/modules/core/infra/services/config/config.dart';
import 'package:ilia_challenge/modules/core/infra/interfaces/int_cache.dart';
import 'package:ilia_challenge/modules/core/infra/interfaces/int_dep_injector.dart';

class AutoInjectorAdapter implements IntDepInjector {
  static final _injector = AutoInjector();

  static get instance => _injector;

  @override
  init() {
    instance
      ..addSingleton(Config.new)
      ..addSingleton(CacheHandlerService.new)
      ..addSingleton(IliaHttpService.new)
      ..commit();
  }

  @override
  find<T>() {
    switch (T) {
      case Config:
        return instance<Config>();
      case IntCache:
        return instance<CacheHandlerService>();
      case IntHttpClient:
        return instance<IliaHttpService>();

      default:
        return null;
    }
  }
}
