import 'dart:convert';

class ProductionCountry {
  final String iso31661;
  final String name;

  ProductionCountry({
    required this.iso31661,
    required this.name,
  });

  factory ProductionCountry.fromJson(String str) =>
      ProductionCountry.fromMap(json.decode(str));

  factory ProductionCountry.fromMap(Map<String, dynamic> json) =>
      ProductionCountry(
        iso31661: json["iso_3166_1"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() {
    return {
      'iso31661': iso31661,
      'name': name,
    };
  }

  String toJson() => json.encode(toMap());
}
