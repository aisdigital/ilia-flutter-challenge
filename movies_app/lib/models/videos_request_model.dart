import 'package:movies_app/models/video_model.dart';

class VideosRequestModel {
  int id;
  List<VideoModel> results;

  VideosRequestModel({
    required this.id,
    required this.results,
  });

  VideosRequestModel.fromJson(Map<String, dynamic> json)
      :  id = json['id'],
         results = (json['results'] as List).map((video) => VideoModel.fromJson(video as Map<String, dynamic>)).toList();

}
