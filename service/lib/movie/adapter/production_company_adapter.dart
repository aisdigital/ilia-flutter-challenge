import 'package:service/movie/entities/production_company_entity.dart';

class ProductionCompanyAdapter {
  static ProductionCompanyEntity fromJson(Map<String, dynamic> json) {
    return ProductionCompanyEntity(
      id: json['id'],
      name: json['name'],
      logoPath: json['logo_path'],
      originCountry: json['origin_country'],
    );
  }

  static Map<String, dynamic> toJson({required ProductionCompanyEntity entity}) {
    return {
      'id': entity.id,
      'name': entity.name,
      'logo_path': entity.logoPath,
      'origin_country': entity.originCountry,
    };
  }
}
