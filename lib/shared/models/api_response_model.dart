import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:ilia_flutter_challenge/shared/models/movie_model.dart';

class ApiResponseModel {
  final Map<String, String> dates;
  final int page;
  final List<MovieModel> results;
  ApiResponseModel({
    required this.dates,
    required this.page,
    required this.results,
  });

  ApiResponseModel copyWith({
    Map<String, String>? dates,
    int? page,
    List<MovieModel>? results,
  }) {
    return ApiResponseModel(
      dates: dates ?? this.dates,
      page: page ?? this.page,
      results: results ?? this.results,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'dates': dates});
    result.addAll({'page': page});
    result.addAll({'results': results.map((x) => x.toMap()).toList()});

    return result;
  }

  factory ApiResponseModel.fromMap(Map<String, dynamic> map) {
    return ApiResponseModel(
      dates: Map<String, String>.from(map['dates']),
      page: map['page']?.toInt() ?? 0,
      results: List<MovieModel>.from(
          map['results']?.map((x) => MovieModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ApiResponseModel.fromJson(String source) =>
      ApiResponseModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'ApiResponseModel(dates: $dates, page: $page, results: $results)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ApiResponseModel &&
        mapEquals(other.dates, dates) &&
        other.page == page &&
        listEquals(other.results, results);
  }

  @override
  int get hashCode => dates.hashCode ^ page.hashCode ^ results.hashCode;
}
