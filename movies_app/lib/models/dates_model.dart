class MovieDatesModel {
  String maximum;
  String minimum;

  MovieDatesModel({
    required this.maximum,
    required this.minimum,
  });

  MovieDatesModel.fromJson(Map<String, dynamic> json)
    : maximum = json['maximum'],
      minimum = json['minimum'];

}