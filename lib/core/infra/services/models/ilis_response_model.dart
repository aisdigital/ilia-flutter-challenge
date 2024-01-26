import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:ilia_challenge/core/domain/interfaces/int_response.dart';

class IliaResponseModel implements IntResponse {
  @override
  Map<String, dynamic> data;
  IliaResponseModel({
    required this.data,
  });

  IliaResponseModel copyWith({
    Map<String, dynamic>? data,
  }) {
    return IliaResponseModel(
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'data': data,
    };
  }

  factory IliaResponseModel.fromMap(Map<String, dynamic> map) {
    return IliaResponseModel(
      data: Map<String, dynamic>.from(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  factory IliaResponseModel.fromJson(String source) =>
      IliaResponseModel.fromMap(json.decode(source));

  @override
  String toString() => 'IliaResponseModel(data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is IliaResponseModel && mapEquals(other.data, data);
  }

  @override
  int get hashCode => data.hashCode;
}
