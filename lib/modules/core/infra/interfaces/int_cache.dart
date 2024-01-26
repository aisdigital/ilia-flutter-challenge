import 'package:ilia_challenge/modules/core/infra/interfaces/int_cache_object.dart';

abstract class IntCache {
  Future<dynamic> get(String key);
  Future put(IntCacheObject obj);
  Future update(IntCacheObject obj);
  Future delete(String key);
  Future clearCache();
}
