import 'dart:convert';
import 'package:flutter/foundation.dart';

class AuthState {
  Map<AuthData, dynamic> data;
  bool remember;
  AuthState({
    this.data = const {},
    this.remember = false,
  });

  AuthState copyWith({
    Map<AuthData, dynamic>? data,
    bool? remember,
  }) {
    return AuthState(
      data: data ?? this.data,
      remember: remember ?? this.remember,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'data': data,
      'remember': remember,
    };
  }

  factory AuthState.fromMap(Map<String, dynamic> map) {
    return AuthState(
      data: Map<AuthData, dynamic>.from(map['data']),
      remember: map['remember'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthState.fromJson(String source) =>
      AuthState.fromMap(json.decode(source));


  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AuthState &&
        mapEquals(other.data, data) &&
        other.remember == remember;
  }

  @override
  int get hashCode => data.hashCode;
}

enum AuthData { signin, signup, remember, user, session }
