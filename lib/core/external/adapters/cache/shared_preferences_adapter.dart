import 'dart:convert';
import 'package:ilia_challenge/core/interfaces/int_cache.dart';
import 'package:ilia_challenge/core/interfaces/int_cache_object.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheAdapter implements IntCache {
  SharedPreferences? _prefs;

  init() async => _prefs ??= await SharedPreferences.getInstance();

  @override
  Future<dynamic> get(String key) async {
    if (_prefs == null) await init();
    final now = DateTime.now();

    final Map<String, dynamic> data =
        json.decode(_prefs!.getString(key) ?? '{}');

    if (data.isEmpty) {
      await _prefs!.remove(key);
      return null;
    }

    DateTime expiration = DateTime.tryParse(data['expiry']) ??
        now.subtract(const Duration(seconds: 1));

    if (now.isAfter(expiration)) {
      await _prefs!.remove(key);
      return null;
    }
    return data['data'];
  }

  @override
  Future put(IntCacheObject obj) async {
    if (_prefs == null) await init();

    final data = json.encode({'data': obj.data, 'expiry': obj.expiry});

    await _prefs!.setString(obj.key, data);
  }

  @override
  Future update(IntCacheObject obj) async {
    if (_prefs == null) await init();
    final data = json.encode({'data': obj.data, 'expiry': obj.expiry});

    await _prefs!.setString(obj.key, data);
  }

  @override
  Future delete(String key) async {
    if (_prefs == null) await init();

    await _prefs!.remove(key);
  }

  @override
  Future clearCache() async {
    if (_prefs == null) await init();
    _prefs?.clear();
  }
}
