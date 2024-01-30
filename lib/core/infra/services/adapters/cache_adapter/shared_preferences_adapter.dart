import 'dart:convert';
import 'package:ilia_challenge/core/domain/core_repository.dart';
import 'package:ilia_challenge/core/infra/interfaces/int_cache.dart';
import 'package:ilia_challenge/core/infra/interfaces/int_cache_object.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesAdapter implements IntCache {
  SharedPreferences? _prefs;

  init() async => _prefs ??= await SharedPreferences.getInstance();

  @override
  Future<dynamic> get(String key) async {
    if (_prefs == null) await init();
    final now = DateTime.now();

    Map<String, dynamic> data = {};

    try {
      json.decode(_prefs!.getString(key) ?? '{}');
    } catch (e, stack) {
      throw PluginException(
          message: 'Não foi possível ler chave no storage. erro: $e',
          stack: stack);
    }

    if (data.isEmpty) {
      try {
        await _prefs!.remove(key);
      } catch (e, stack) {
        throw PluginException(
            message: 'Não foi possível remover dado corrompido. erro: $e',
            stack: stack);
      }
      return null;
    }

    DateTime expiration = DateTime.tryParse(data['expiry']) ??
        now.subtract(const Duration(seconds: 1));

    if (now.isAfter(expiration)) {
      try {
        await _prefs!.remove(key);
      } catch (e, stack) {
        throw PluginException(
            message: 'Não foi possível remover dado desatualizado. erro: $e',
            stack: stack);
      }
      return null;
    }
    return data['data'];
  }

  @override
  Future put(IntCacheObject obj) async {
    if (_prefs == null) await init();

    final data = json.encode({'data': obj.data, 'expiry': obj.expiry});

    try {
      await _prefs!.setString(obj.key, data);
    } catch (e, stack) {
      throw PluginException(
          message: 'Não foi possível atualizar o storage. erro: $e',
          stack: stack);
    }
  }

  @override
  Future update(IntCacheObject obj) async {
    if (_prefs == null) await init();
    final data = json.encode({'data': obj.data, 'expiry': obj.expiry});
    try {
      await _prefs!.setString(obj.key, data);
    } catch (e, stack) {
      throw PluginException(
          message: 'Não foi possível atualizar o storage. erro: $e',
          stack: stack);
    }
  }

  @override
  Future delete(String key) async {
    if (_prefs == null) await init();

    try {
      await _prefs!.remove(key);
    } catch (e, stack) {
      throw PluginException(
          message: 'Não foi possível removerchave do storage. erro: $e',
          stack: stack);
    }
  }

  @override
  Future clear() async {
    if (_prefs == null) await init();
    try {
      _prefs?.clear();
    } catch (e, stack) {
      throw PluginException(
          message: 'Não foi possível limpar o storage. erro: $e', stack: stack);
    }
  }
}
