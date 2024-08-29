class ImagesConfModel {
  String baseUrl;
  String secureBaseUrl;
  List<String> backdropSizes;
  List<String> logoSizes;
  List<String> posterSizes;
  List<String> profileSizes;
  List<String> stillSizes;

  ImagesConfModel({
    required this.baseUrl,
    required this.secureBaseUrl,
    required this.backdropSizes,
    required this.logoSizes,
    required this.posterSizes,
    required this.profileSizes,
    required this.stillSizes,
  });

  factory ImagesConfModel.fromJson(Map<String, dynamic> json) {
    return ImagesConfModel(
      baseUrl: json['base_url'],
      secureBaseUrl: json['secure_base_url'],
      backdropSizes: List<String>.from(json['backdrop_sizes'] as List<dynamic>),
      logoSizes: List<String>.from(json['logo_sizes'] as List<dynamic>),
      posterSizes: List<String>.from(json['poster_sizes'] as List<dynamic>),
      profileSizes: List<String>.from(json['profile_sizes'] as List<dynamic>),
      stillSizes: List<String>.from(json['still_sizes'] as List<dynamic>),
    );
  }
}
