import 'package:movie_catalog/features/movies_list/domain/entities/dates.dart';

class DatesModel extends Dates {
  DatesModel({
    required super.maximum,
    required super.minimum,
  });

  factory DatesModel.fromJson(Map<String, dynamic> json) => DatesModel(
        maximum: json['maximum'] as String,
        minimum: json['minimum'] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'maximum': maximum,
        'minimum': minimum,
      };

  DatesModel copyWith({
    String? maximum,
    String? minimum,
  }) {
    return DatesModel(
      maximum: maximum ?? this.maximum,
      minimum: minimum ?? this.minimum,
    );
  }
}
