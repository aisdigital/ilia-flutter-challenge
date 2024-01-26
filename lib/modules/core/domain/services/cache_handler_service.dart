import 'package:ilia_challenge/modules/core/domain/interfaces/int_cache_service.dart';
import 'package:ilia_challenge/modules/core/adapters/cache_adapter/shared_preferences_adapter.dart';
import 'package:ilia_challenge/modules/core/infra/interfaces/int_cache.dart';
import 'package:ilia_challenge/modules/core/infra/interfaces/int_cache_object.dart';

class CacheHandlerService implements IntCacheHandlerService {
  final IntCache cache = SharedPreferencesAdapter();
  @override
  Future put(IntCacheObject obj) async {
    await cache.put(obj);
  }

  @override
  Future get(String key) async {
    return await cache.get(key);
  }

  @override
  Future update(IntCacheObject obj) async {
    await cache.update(obj);
  }

  @override
  Future delete(String key) async {
    await cache.delete(key);
  }

  @override
  Future clear() async {
    await cache.clearCache();
  }
}
