import 'dart:convert';

import 'package:ilia_challenge/core/infra/interfaces/int_cache_object.dart';

class CacheObject implements IntCacheObject {
  @override
  String key;
  @override
  String data;
  @override
  String? expiry;

  Duration? duration;

  CacheObject({
    required this.key,
    required this.data,
    this.expiry,
    this.duration = const Duration(minutes: 5),
  }) {
    expiry = setDuration(duration!);
  }

  setDuration(Duration duration) {
    return DateTime.now().add(duration).toIso8601String();
  }

  CacheObject copyWith({
    String? key,
    String? data,
    String? expiry,
  }) {
    return CacheObject(
      key: key ?? this.key,
      data: data ?? this.data,
      expiry: expiry ?? this.expiry,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'key': key,
      'data': data,
      'expiry': expiry,
    };
  }

  factory CacheObject.fromMap(Map<String, dynamic> map) {
    return CacheObject(
      key: map['key'] ?? '',
      data: map['data'] ?? '',
      expiry: map['expiry'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CacheObject.fromJson(String source) =>
      CacheObject.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CacheObject(key: $key, data: $data, expiry: $expiry)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CacheObject &&
        other.key == key &&
        other.data == data &&
        other.expiry == expiry;
  }

  @override
  int get hashCode {
    return key.hashCode ^ data.hashCode ^ expiry.hashCode;
  }
}
