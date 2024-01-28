import 'dart:convert';

import 'package:ilia_challenge/modules/auth/contracts/interfaces/i_user.dart';

class IliaUser implements IUser {
  @override
  String id;
  @override
  String email;
  @override
  String? name;
  @override
  String? nick;
  @override
  String? profile;
  @override
  String? refreshToken;

  IliaUser({
    required this.id,
    required this.refreshToken,
    required this.email,
    this.name,
    this.nick,
    this.profile,
  });

  IliaUser copyWith({
    String? email,
    String? id,
    String? name,
    String? nick,
    String? profile,
    String? refreshToken,
  }) {
    return IliaUser(
      email: email ?? this.email,
      id: id ?? this.id,
      name: name ?? this.name,
      nick: nick ?? this.nick,
      profile: profile ?? this.profile,
      refreshToken: refreshToken ?? this.refreshToken,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'id': id,
      'name': name,
      'nick': nick,
      'profile': profile,
      'refreshToken': refreshToken,
    };
  }

  factory IliaUser.fromMap(Map<String, dynamic> map) {
    return IliaUser(
      email: map['email'],
      id: map['id'] ?? '',
      name: map['name'],
      nick: map['nick'],
      profile: map['profile'],
      refreshToken: map['refreshToken'],
    );
  }

  String toJson() => json.encode(toMap());

  factory IliaUser.fromJson(String source) =>
      IliaUser.fromMap(json.decode(source));

  @override
  String toString() {
    return 'IliaUser(email: $email, id: $id, name: $name, nick: $nick, profile: $profile, refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is IliaUser &&
        other.email == email &&
        other.id == id &&
        other.name == name &&
        other.nick == nick &&
        other.profile == profile &&
        other.refreshToken == refreshToken;
  }

  @override
  int get hashCode {
    return email.hashCode ^
        id.hashCode ^
        name.hashCode ^
        nick.hashCode ^
        profile.hashCode ^
        refreshToken.hashCode;
  }
}
