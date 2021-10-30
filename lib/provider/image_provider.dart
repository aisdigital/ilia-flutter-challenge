import 'package:ilia_challenge/interface/image_interface.dart';

///The ideal was to make a singleton api class for dio instantiation, but I'm running out of time to fix this for tomorrow's presentation
class ProviderImage implements InterfaceImage {
  var backDropUrl = "https://image.tmdb.org";
  var coverConfig = "/t/p/w1280/";
  var posterConfig = "/t/p/w500/";
  var pathNotFound =
      "https://www.themoviedb.org/assets/2/v4/logos/256x256-dark-bg-01a111196ed89d59b90c31440b0f77523e9d9a9acac04a7bac00c27c6ce511a9.png";

  @override
  Future<String?> getMovieUrlCover(String coverPath) async {
    if (coverPath.isEmpty) {
      return pathNotFound;
    }
    return backDropUrl + posterConfig + coverPath;
  }

  @override
  Future<String?> getMovieUrlPoster(String posterPath) async {
    if (posterPath.isEmpty) {
      return pathNotFound;
    }
    return backDropUrl + posterConfig + posterPath;
  }
}
