import 'package:ilia_challenge/core/infra/interfaces/int_cache_object.dart';

abstract class IntCacheHandlerService {
  Future get(String key);
  Future put(IntCacheObject obj);
  Future update(IntCacheObject obj);
  Future delete(String key);
  Future clear();
}
