import 'package:auto_injector/auto_injector.dart';
import 'package:ilia_challenge/core/config/config.dart';
import 'package:ilia_challenge/core/external/adapters/cache/shared_preferences_adapter.dart';
import 'package:ilia_challenge/core/external/adapters/http_client.dart/dio.dart';
import 'package:ilia_challenge/core/interfaces/int_cache.dart';
import 'package:ilia_challenge/core/interfaces/int_dep_injector.dart';
import 'package:ilia_challenge/core/interfaces/int_http_client.dart';

class DependenciesInjector implements IntDepInjector {
  factory DependenciesInjector() => _this;

  DependenciesInjector._();

  static final DependenciesInjector _this = DependenciesInjector._();

  static final _injector = AutoInjector();

  static get instance => _injector;

  @override
  init() {
    instance
      ..addSingleton(Config.new)
      ..addSingleton(CacheAdapter.new)
      ..add(DioClient.new)
      ..commit();
  }

  @override
  find<T>() {
    switch (T) {
      case Config:
        return instance<Config>();
      case IntCache:
        return instance<CacheAdapter>();
      case IntHttpClient:
        return instance<DioClient>();

      default:
        return null;
    }
  }
}
