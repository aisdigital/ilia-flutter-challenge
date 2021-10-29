import 'package:ilia_challenge/interface/image_interface.dart';

///The ideal was to make a singleton api class for dio instantiation, but I'm running out of time to fix this for tomorrow's presentation
class ProviderImage implements InterfaceImage {
  var backDropUrl = "https://image.tmdb.org";
  var coverConfig = "/t/p/w1280/";
  var posterConfig = "/t/p/w500/";

  @override
  Future<String?> getMovieUrlCover(String coverPath) async {
    return backDropUrl + coverConfig + coverPath;
  }

  @override
  Future<String?> getMovieUrlPoster(String posterPath) async {
    return backDropUrl + posterConfig + posterPath;
  }
}
