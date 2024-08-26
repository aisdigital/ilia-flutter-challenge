import 'package:core/type/output.dart';
import 'package:service/movie/entities/video_entity.dart';

abstract class MovieVideoRepository {
  Future<Output<List<VideoEntity>>> fetch({required int id});
}
