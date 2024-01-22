import 'package:ilia_flutter_challenge/app/modules/movie_details/domain/entities/movie_videos.dart';

abstract class MovieVideosDatasource {
  Future<MovieVideos> fetchAllMovieVideos(int id);
}
