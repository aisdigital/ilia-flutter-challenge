import 'package:ilia_challenge/modules/core/external/cache_adapter/shared_preferences_adapter.dart';
import 'package:ilia_challenge/modules/core/infra/interfaces/int_cache.dart';
import 'package:ilia_challenge/modules/core/infra/interfaces/int_cache_object.dart';

class CacheHandlerService {
  final IntCache cache = SharedPreferencesAdapter();

  put(IntCacheObject obj) async {
    await cache.put(obj);
  }

  get(String key) async {
    return await cache.get(key);
  }

  update(IntCacheObject obj) async {
    await cache.update(obj);
  }

  delete(String key) async {
    await cache.delete(key);
  }

  clearCache() async {
    await cache.clearCache();
  }
}
