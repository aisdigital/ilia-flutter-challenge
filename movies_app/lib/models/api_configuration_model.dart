import 'poster_model.dart';

class ApiConfigurationModel {
  ImagesConfModel images;
  List<String> changeKeys;

  ApiConfigurationModel({
    required this.images,
    required this.changeKeys,
  });

  ApiConfigurationModel.fromJson(Map<String, dynamic> json)
      : images = ImagesConfModel.fromJson(json['images'] as Map<String, dynamic>),
        changeKeys = List<String>.from(json['change_keys']);

}
